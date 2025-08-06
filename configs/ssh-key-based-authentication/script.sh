#!/bin/bash

if [ -f .env ]; then
  source .env
elif [ -f ../../.env ]; then
  source ../../.env
else
  echo "Error: archivo .env no encontrado ni en el directorio actual ni en la raiz del proyecto"
  exit 1
fi

# Set paths for the SSH keys
SSH_DIR="$HOME/.ssh"
PRIVATE_KEY="$SSH_DIR/id_rsa"
PUBLIC_KEY="$SSH_DIR/id_rsa.pub"

# Generate SSH key pair if it doesn't already exist
echo "Generating SSH key pair..."
if [ ! -f "$PRIVATE_KEY" ]; then
  ssh-keygen -t rsa -b 4096 -f "$PRIVATE_KEY" -N ""
  echo "SSH key pair generated."
else
  echo "SSH key pair already exists."
fi

# Copy the public key to the remote server
echo "Copying public key to the remote server..."
ssh-copy-id -f -i "$PUBLIC_KEY" -p $SSH_PORT $USER@$SERVER_DOMAIN

# Verify SSH key-based login
echo "Testing SSH key-based authentication..."
ssh -p $SSH_PORT $USER@$SERVER_DOMAIN "echo 'SSH key-based authentication successful!'"

# Confirm success
if [ $? -eq 0 ]; then
  echo "Key-based authentication setup successfully."
else
  echo "There was an issue with the key-based authentication setup."
fi
