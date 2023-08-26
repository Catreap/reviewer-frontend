FROM node:20-alpine

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY . .

RUN npm install -g pnpm
RUN pnpm install
RUN pnpm build

ENV NUXT_HOST=0.0.0.0
ENV NUXT_PORT=3000

EXPOSE 3000

ENTRYPOINT ["node", ".output/server/index.mjs"]
