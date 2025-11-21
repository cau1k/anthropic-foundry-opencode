FROM node:20-bookworm

ENV BUN_INSTALL=/usr/local/bun
ENV PATH="${BUN_INSTALL}/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

RUN apt-get update \
 && apt-get install -y --no-install-recommends curl ca-certificates \
 && curl -fsSL https://bun.sh/install | bash \
 && chmod -R a+rX "${BUN_INSTALL}" \
 && npm install -g opencode-ai@latest \
 && rm -rf /var/lib/apt/lists/*

RUN useradd -m -d /home/user -s /bin/bash user \
 && mkdir -p /home/user/.config/opencode /home/user/workspace \
 && chown -R user:user /home/user

WORKDIR /home/user/workspace
USER user

CMD ["sleep", "infinity"]
