export const environment = {
  production: true,
  apiUrl: "__API_HOST__", //APP_HOST muss gesetzt sein z.B. 'https://conduit.example.com/api', oder beim Docker build step mit angegeben werden 'docker build -t conduit-frontend --build-arg APP_HOST=https://conduit.example.com .'.
};
