# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.241.1/containers/python-3/.devcontainer/base.Dockerfile

# [Choice] Python version (use -bullseye variants on local arm64/Apple Silicon): 3, 3.10, 3.9, 3.8, 3.7, 3.6, 3-bullseye, 3.10-bullseye, 3.9-bullseye, 3.8-bullseye, 3.7-bullseye, 3.6-bullseye, 3-buster, 3.10-buster, 3.9-buster, 3.8-buster, 3.7-buster, 3.6-buster
FROM mcr.microsoft.com/vscode/devcontainers/python:0-3.10-bullseye

# Install TexLive for building PDF output
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends texlive-full

# Install OpenJDK
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install --no-install-recommends openjdk-11-jre graphviz

# Copy install and launcher script to bin:
COPY ./dev_install /bin
COPY ./dev_launcher /bin
