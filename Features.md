# Project Overview: Microservices Architecture

## Flow of Application

1. **User Registration/Login**: 
   - Users begin by registering or logging in
   - **Managed by**: **auth-service**

2. **Train Search**: 
   - Upon successful authentication, users can select their **source**, **destination**, and **date** to retrieve a list of available trains
   - **Managed by**: **train-service**

3. **Train Selection and Pricing**: 
   - After browsing the available options, users can select a train to view its layout. The **pricing-service** calculates the ticket prices based on user selection.
   - **Managed by**: **pricing-service**

4. **Ticket Management**: 
   - If users decide to select a ticket, a request is sent to the **cache-service**, which updates the availability status of the ticket, making it unavailable for other users.
   - If users decide to deselect a ticket, a request is sent to the **cache-service**, which updates the availability status of the ticket, making it available for other users.
   - **Managed by**: **cache-service**

5. **Ticket Purchase**: 
   - When users are ready to proceed, they can select one or multiple tickets and click the "Pay for Tickets" button. This action denotes the payment process.
   - **Managed by**: **ticket-service**

6. **Payment Processing**: 
   - After the payment is successfully processed, the **ticket-service** adds the purchased tickets to the database. This process is securely authorized by the **auth-service**, ensuring that only authenticated users can make bookings.
   - **Managed by**: **ticket-service** (authorized by **auth-service**)


## Targets Completed

### 1. **Microservices Architecture**

#### **Service Discovery**
- **Service-Oriented Architecture**: 
  - The backend is divided into multiple microservices, enabling easy discovery and interaction among them:
    - **auth-service**: Handles user authentication and validation (Node.js).
    - **train-service**: Manages train information (Django).
    - **ticket-service**: Facilitates the ticket booking process (Node.js).
    - **pricing-service**: Manages ticket pricing (Node.js).
    - **cache-service**: Manages ticket availability and ticket booking process locking at the cache level (Node.js).
    - **web-service**: Serves the UI (Node.js).

#### **Service Build**
- **Independent Development**: 
  - Each microservice is developed in separate repositories, allowing teams to work independently and deploy services without affecting others.
- **Technology Stack**: 
  - Services leverage a mix of technologies, with Node.js and Django chosen based on specific use cases and team expertise.

### 2. **Inter-Service Communication**
- **HTTP Requests**: 
  - Microservices communicate via HTTP requests, invoking operations or accessing shared data as needed.
- **Middleware Integration**: 
  - Middleware is implemented for handling HTTP requests, event publishing, and consumption to maintain a clean separation of concerns and promote reusability.

---

### 3. **Containerization and Deployment Configurations**
- **Containerization with Docker**: 
  - The client (frontend) and backend microservices are containerized using Docker to ensure consistent deployment across different environments.
  
- **Cloud Deployment with Kubernetes**: 
  - All services are deployed on DigitalOcean’s Kubernetes cluster.
  - Kubernetes Deployment and Service YAML files are utilized for managing application lifecycle and networking.

- **Horizontal Pod Autoscaling (HPA)**: 
  - HPA is configured for all microservices to automatically scale based on CPU utilization, ensuring optimal performance under varying loads.

- **Resource Limitation**: 
  - Resource limits are applied to all deployments to prevent resource exhaustion.

---

### 4. **Testing**
- **Functional Testing**: 
  - Comprehensive test suites are written for the microservices using Jest and Supertest, ensuring functionality and integration testing for APIs.
  
- **Load Testing**: 
  - Managed with k6, creating test loads on services.

- **Performance Testing**: 
  - Managed with k6, simulating performance under load.

---

### 5. **Monitoring**
- **Metrics Monitoring**: 
  - Prometheus and Grafana are integrated to monitor the health and performance of the system locally, providing insights into resource utilization and metrics.
  
- **HPA Monitoring**: 
  - HPA configurations and status can be monitored effectively.

---

### 6. **Database**
- **PostgreSQL Cluster**: 
  - PostgreSQL is utilized as the database, hosted on DigitalOcean.

- **Redis Caching**: 
  - Redis is deployed with Kubernetes and used for caching in the backend services.

---

### 7. **Cloud Deployment**
- **Domain Registration and Configuration**: 
  - Registered and configured the domain **district12.xyz** through NameCheap for seamless access to the application.

- **Deployment with Ingress and Kong**: 
  - Deployed the full website using an Ingress controller with Kong and Helm, effectively managing routing for multiple subdomains.

- **Preflight Request Handling and CORS Configuration**: 
  - Implemented CORS policies to properly handle preflight requests, ensuring secure communication between the client and backend services.

- **HTTPS Protocol**: 
  - Configured Ingress, Cluster Issuer, and Cert-Manager to switch from HTTP to HTTPS protocol.

---

### 8. **Continuous Integration and Deployment**
- **GitHub Actions**: 
  - Continuous integration and deployment pipelines are set up using GitHub Actions, although further testing is required.

---

### 9. **Monitoring Tools**
- **Prometheus Integration**: 
  - Prometheus is deployed alongside the cloud infrastructure to monitor the performance and health of the microservices.

- **Grafana Integration**: 
  - Grafana is deployed alongside the cloud infrastructure to visualize the performance and health of the microservices.

---