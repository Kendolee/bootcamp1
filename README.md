Speedtest Tracker – Project Documentation
1. Introduction
The Speedtest Tracker is a self-hosted internet performance monitoring tool designed to automatically measure and log internet speed over time. It continuously runs scheduled tests to check three key metrics:
* Download Speed (Mbps) – How quickly data can be received from the internet.
* Upload Speed (Mbps) – How quickly data can be sent to the internet.
* Ping (ms) – The delay in data transmission, which affects responsiveness.
How it works:
* At pre-set intervals (e.g., every hour), the system automatically runs a speed test using reliable testing servers.
* The results are stored in a database and displayed visually through a web-based dashboard.
* The dashboard allows you to see real-time performance and historical trends.
* Alerts can be configured if speeds drop below certain thresholds.
In short, this tool keeps watch over your internet connection and ensures you always know whether you’re getting the service you’re paying for.

2. Usefulness of the Project
The Speedtest Tracker is valuable for:
* Real-time Monitoring – Provides instant visibility into current network performance.
* Historical Trends – Tracks performance over time to spot recurring slowdowns or outages.
* Proactive Alerts – Helps detect and respond to problems before they impact users.
* Evidence for ISP – Generates proof of performance (or underperformance) when dealing with internet service providers.
* Performance Assurance – Validates that high-speed connections (like gigabit fiber) are performing at expected levels.

3. Connection to EC2 Instance
To make the Speedtest Tracker accessible anywhere, we hosted it on an Amazon EC2 instance. The process included:
1. Launching the EC2 Instance
    * Selected an Ubuntu-based instance.
    * Chose appropriate CPU/RAM for the application.
    * Configured a static public IP.
2. Installing Dependencies
    * Installed Docker and Docker Compose for easy deployment.
    * Pulled the Speedtest Tracker Docker image.
3. Running the Application
    * Configured the container with required environment variables (test schedule, port, etc.).
    * Mapped the application to port 8070 so it could be accessed via the browser.
4. Security Configuration
    * Updated AWS Security Groups to allow inbound traffic on port 8070.
    * Enabled SSH access for maintenance.
With this setup, the Speedtest Tracker dashboard is reachable from any location using the EC2 public IP and port number.

4. Problems Encountered
During deployment, we faced several challenges:
* Port Accessibility Issue – The dashboard wasn’t loading because the EC2 firewall (Security Group) wasn’t allowing external traffic on the required port.
* Initial Test Failures – The container could not run speed tests due to missing permissions for network tools inside the Docker image.
* Time Zone Mismatch – Test results were showing incorrect timestamps because the server defaulted to UTC instead of local time.

5. How We Solved It
We addressed these problems as follows:
1. Port Accessibility – Modified AWS Security Group rules to allow inbound TCP traffic on port 8070 from all IP addresses.
2. Test Failures – Rebuilt the Docker container with necessary system utilities and updated network permissions.
3. Time Zone Mismatch – Configured the container to use the correct local timezone by mounting /etc/localtime and /etc/timezone into the container.

6. Example Results (from screenshot)
* Latest Download: 975.80 Mbps (0.13% slower than average)
* Latest Upload: 976.05 Mbps (0.04% slower than average)
* Latest Ping: 1.92 ms (31.65% faster than average)
* Over the last 24h, the performance remained stable and consistent.

Conclusion
The Speedtest Tracker project gives us a powerful, always-available window into our internet performance. By hosting it on AWS EC2, we ensured:
* Remote accessibility
* Automated monitoring
* Historical data tracking
This system eliminates guesswork, improves troubleshooting speed, and strengthens communication with our ISP.
