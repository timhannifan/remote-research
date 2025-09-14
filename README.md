# remote-research

A complete MCP (Model Context Protocol) implementation for research paper discovery and analysis using Anthropic Claude.

## Dependencies

- **Docker** - For containerized deployment
- **Make** - For simplified commands
- **Node.js** - (Installed in container) For MCP filesystem server
- **Python 3.11+** - (Installed in container) For main application

## Architecture

The system consists of two main services:

- **Research Server** (`src/research_server.py`) - FastMCP server providing arXiv search tools and paper management
- **Chatbot** (`src/mcp_chatbot.py`) - Claude-powered chatbot that connects to multiple MCP servers

MCP servers connected:
- `research` - Local research server (SSE transport)
- `filesystem` - File operations (npx @modelcontextprotocol/server-filesystem)
- `fetch` - Web fetching capabilities (uvx mcp-server-fetch)
- `markdownify` - File conversion to Markdown (PDF, images, audio, etc.)

## Running

```bash
# Setup (creates .env from .env.example)
make setup

# Edit .env and add your ANTHROPIC_API_KEY
# Get key from: https://console.anthropic.com/

# Start services
make up

# In another terminal, run the interactive chatbot
docker compose exec chatbot python src/mcp_chatbot.py
```

## Sample Queries

- "Search for papers on parallel agents, write a summary, then save the file to md"
- `@folders` - List available topics
- `@parallel_agents` - View papers in specific topic
- `/prompts` - List available prompts
- `/prompt generate_search_prompt topic=history num_papers=2`

## Output Files

Files created by markdownify (PDF conversions, audio transcriptions, etc.) will appear in the output directory for easy access.

## Commands

- `make help` - Show all available commands
- `make up` - Start services
- `make down` - Stop services  
- `make logs` - View service logs
- `make clean` - Remove containers and clean up