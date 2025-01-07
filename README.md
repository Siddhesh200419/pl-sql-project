# pl-sql-project
# Name: Siddhesh Gite
# Gmail: siddheshgite2004@gmail.com

# Tourism and Travel Management System

## Overview
The **Tourism and Travel Management System** is a database-driven application that helps manage various operations in a tourism and travel agency. This system is developed using **SQL (Structured Query Language)** and covers key functionalities such as customer management, travel package management, booking details, and payment processing.

---


## The Database Schema

This repository contains the SQL script for creating and managing the database schema for a system involving customers, agents, destinations, tour packages, bookings, and their related transactions.

## Project Description
This project aims to provide a robust database schema to support a travel management system. The system allows for managing customers, booking processes, payments, agent commissions, and feedback mechanisms efficiently. It is designed to handle:

- **Customer Management**: Storing customer details and tracking their bookings.
- **Tour and Package Management**: Organizing destinations and tour packages.
- **Financial Tracking**: Managing payments and generating revenue reports.
- **Review and Feedback**: Collecting and analyzing customer reviews.

The schema is scalable and can be adapted for businesses in the travel and tourism industry to streamline operations and improve customer satisfaction.

## Features
- **Comprehensive Schema**: Includes tables, procedures, and triggers for managing various aspects of the system.
- **Flexible Procedures**: Automates booking, reporting, and review submissions.
- **Dynamic Triggers**: Ensures data consistency and automates updates.

## Database Objects

### Tables
- **Customers Table**: Stores customer information including name, email, phone, address, and creation date.
- **Agents Table**: Manages details about agents, including their commission rates.
- **Destinations Table**: Contains information about travel destinations.
- **TourPackages Table**: Defines available tour packages and their details.
- **Bookings Table**: Tracks customer bookings.
- **Payments Table**: Logs payment information for bookings.
- **Transport Table**: Manages transportation details for tours.
- **Reviews Table**: Stores customer reviews and ratings.

### Procedures
- **CreateBooking**: Automates the process of creating a new booking.
- **CancelBooking**: Handles booking cancellations.
- **RevenueReport**: Generates a revenue report for a specified period.
- **PopularDestinations**: Identifies the most frequently booked destinations.
- **SubmitReview**: Records a customer's review for a tour.
- **AssignTransport**: Assigns transportation for a booking.

### Triggers
- **UpdatePopularity**: Updates the popularity of destinations based on bookings.
- **EnsurePayment**: Ensures a payment record exists for every booking.

## Usage
1. Clone the repository.
2. Import the SQL script into your preferred database management system (e.g., Oracle, MySQL).
3. Execute the script to create the necessary database structure.

## Requirements
- SQL-compatible database system (e.g., Oracle, MySQL).
- Basic understanding of SQL for modifications if needed.

## Contributing
Feel free to fork this repository, make improvements, and submit pull requests. Contributions are always welcome.

## License
This project is open-source and available under the [MIT License](LICENSE).

---

If you have questions or encounter any issues, please open an issue in this repository or contact the maintainer.
