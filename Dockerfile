FROM node:24-bookworm-slim

ENV NODE_ENV=development

WORKDIR /workspace

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    git \
    openssh-client \
    && rm -rf /var/lib/apt/lists/*

COPY package.json package-lock.json* ./
RUN npm ci --prefer-offline --no-audit --no-fund

COPY . .

EXPOSE 3000

CMD ["npm", "run", "dev"]
