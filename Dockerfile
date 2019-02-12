# Use node:10, the current stable release, for the build stage
FROM node:10 as builder

# Copy application source code to /opt/k8s-helm-practice directory of your
# container
COPY . /opt/k8s-helm-practice

# Change directory to where the application source code was copied
WORKDIR /opt/k8s-helm-practice

# Install dependencies of your app, defined into package.json
RUN \
  set -e; \
  npm ci; \
  npm run build;

# Use node:10-alpine for the target image
FROM node:10-alpine

# Copy the application and installed modules from the previous build stage
COPY --from=builder /opt/k8s-helm-practice /opt/k8s-helm-practice

# Change directory to where the application is
WORKDIR /opt/k8s-helm-practice

# Add environmental variable for the server port
ENV PORT=3000

# Expose the server port that is specified
EXPOSE $PORT

# Run the app!
CMD ["npm", "start"]
