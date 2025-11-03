# 1. Angular build
FROM node:18 AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

ARG API_HOST="http://localhost:8000"
# Platzhalter in environment.prod.ts ersetzen
RUN API_HOST_TRIMMED=$(echo "$API_HOST" | sed 's:/*$::') \
 && sed -i "s|__API_HOST__|${API_HOST_TRIMMED}/api|g" src/environments/environment.ts
RUN npm run build --prod

# 2. NGINX for serving Angular
FROM nginx:alpine
COPY --from=build /app/dist/angular-conduit /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]



