FROM node:24-bookworm-slim AS builder
ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
RUN corepack enable
WORKDIR /app

COPY package.json pnpm-lock.yaml pnpm-workspace.yaml ./
ENV CI=true
RUN pnpm install --frozen-lockfile

COPY . .
RUN pnpm run build

ENV HOST=0.0.0.0
ENV PORT=3000
EXPOSE 3000
CMD ["node", "./dist/server/entry.mjs"]
