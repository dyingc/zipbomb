#!/usr/bin/env python3

import torch
import torch.nn as nn

# Define a simple neural network model
class SimpleModel(nn.Module):
    def __init__(self):
        self.n_layer = 128 # number of Linear layers that created *2 files under `data`
        super(SimpleModel, self).__init__()
        for i in range(self.n_layer):
          setattr(self, f'layer_{i}', nn.Linear(1, 1))

    def forward(self, x):
        for i in range(self.n_layer):
            x = getattr(self, f'layer_{i}')(x)
        return x

# Instantiate and save the model
model = SimpleModel()
#torch.save(model.state_dict(), 'simple_model.pth')

# Load the model
loaded_model = SimpleModel()
loaded_model.load_state_dict(torch.load('simple_model.pth'))
loaded_model.eval()  # set the model to evaluation mode
