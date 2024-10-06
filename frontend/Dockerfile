FROM node:22

WORKDIR /app

# Set environment variables for npm
ENV NPM_CONFIG_LOGLEVEL=warn
ENV NPM_CONFIG_PROGRESS=false
ENV NPM_CONFIG_RETRY=3
ENV NPM_CONFIG_FUND=false

COPY admin-panel/package.json ./
COPY admin-panel/package-lock.json ./

RUN npm install

CMD ["npm", "run", "dev"]
