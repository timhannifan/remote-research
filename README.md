# remote-research

A complete implementation from this course https://learn.deeplearning.ai/courses/mcp-build-rich-context-ai-apps-with-anthropic.

To use `inspector`:
```bash
npx @modelcontextprotocol/inspector uv run research_server.py
```

To run the chatbot:
```bash
uv run mcp_chatbot.py
```

Sample query: Search for papers on parallel agents."

Then thy the following:
- @folders
- @parallel_agents
- /prompts
- /prompt generate_search_prompt topic=history num_papers=2


Alternatively: "Find a paper on MCP architecture best practices and write a summary to a md file"

