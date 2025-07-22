# Eto Ride – Smart Ride Booking Platform

[![View on GitHub](https://img.shields.io/badge/View%20Repo-Eto--app-blue?logo=github)](https://github.com/PraJwaL-SDE/Eto-app.git)

**Eto Ride** is a next-gen **ride-booking platform** focused on **safety**, **trust**, and **convenience**, inspired by Uber but designed with **user-centric innovations**.

---

## 🚗 Why Eto Ride?

- **Safety First:** Guardian tracking lets family members monitor rides in real-time.
- **Accessibility:** Voice-based ride booking for the visually impaired and elderly.
- **Transparency:** Route reasoning explains ride paths using **traffic** and **safety data**.

---

## ✨ Key Features

- 🛡️ **Guardian Ride Tracking**  
  Family can follow the ride progress live.

- 🎙️ **Voice-Based Ride Booking**  
  Book rides using voice commands for hands-free and accessible experience.

- 🗺️ **Route Reasoning**  
  Explains why a route is chosen (traffic conditions, safety data, etc).

- 📍 **Geofencing Alerts**  
  Get notified when a vehicle enters or exits specific zones.

- 🔄 **Real-Time Location Updates**  
  Powered by **Kafka** and **WebSocket** for seamless live tracking.

---



## 🖼️ See It In Action!


<table>
<tr>
<td align="center">
<b>Usertype Selection</b><br>
<img src="https://github.com/user-attachments/assets/94773bb0-c089-4267-acc6-b368c1efaf4d" width="250">
</td>
<td align="center">
<b>Driver Account Summay</b><br>
<img src="https://github.com/user-attachments/assets/5ae7e764-eba9-4c64-855a-28726592b265" width="250">
</td>
</tr>
<tr>
<td align="center">
<b>Location Selection (Manual + Voice)</b><br>
<img src="https://github.com/user-attachments/assets/3cc6f756-25bb-4edd-9695-0891c31c3e70" width="250">
</td>
<td align="center">
<b>Gurdian Traking</b><br>
<img src="https://github.com/user-attachments/assets/f58b2bcc-a09d-41ea-8905-63dbb30a6591" width="250">
</td>
</tr>
</table>

---

## 🛠️ Tech Stack

| Technology | Purpose |
|------------|---------|
| **Flutter** | Cross-platform App Development |
| **Node.js** | Backend Services |
| **Supabase** | Authentication & Database |
| **Kafka** | Real-Time Data Streaming |
| **Google Maps API** | Maps, Routing, Geolocation |
| **Gemini API** | Voice & AI Capabilities |
| **WebSocket** | Real-time Communication |

---

## 📂 Project Structure

lib/

├── presentation/ # UI Screens & Widgets

├── data/         # Firebase, APIs, RabbitMQ

├── controllers/  # GetX Controllers

└── utils/        # Helpers & Constants
