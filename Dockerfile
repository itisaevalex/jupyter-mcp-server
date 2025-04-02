# Copyright (c) 2023-2024 Datalayer, Inc.
#
# BSD 3-Clause License

FROM python:3.10-slim

WORKDIR /app

COPY pyproject.toml pyproject.toml
COPY LICENSE LICENSE
COPY README.md README.md
COPY jupyter_mcp_server/* jupyter_mcp_server/

RUN pip install -e .

RUN pip uninstall -y pycrdt datalayer_pycrdt
RUN pip install datalayer_pycrdt

CMD ["python", "-m", "jupyter_mcp_server.server"]
