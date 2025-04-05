# Generated by https://smithery.ai. See: https://smithery.ai/docs/config#dockerfile
FROM python:3.12-alpine

# Install build dependencies if needed
RUN apk add --no-cache gcc musl-dev linux-headers

# Upgrade pip
RUN pip install --no-cache-dir --upgrade pip

# Install dependencies from pyproject.toml
# Since the project uses pyproject.toml, we assume dependencies are managed by pip
RUN pip install --no-cache-dir httpx "mcp[cli]>=1.6.0"

# Copy application code
WORKDIR /app
COPY . /app

# Expose ports if needed (MCP typically uses stdio, so no ports necessary)

# Command to run the MCP server
CMD ["python", "server.py"]