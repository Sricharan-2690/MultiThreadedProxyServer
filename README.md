# 📘 **Multi-Threaded Proxy Server (With & Without Cache)**

### *Explained in a Simple Story Format*

---

## 📑 **Index**

* [Introduction](#-1-introduction--what-is-a-proxy-server)
* [Why Build This Project?](#-2-why-build-this-project-motivation)
* [Working of the Proxy — Story Flow](#-3-basic-working-of-your-proxy--story-flow)
* [Multi-Threading Implementation](#-4-how-multi-threading-is-implemented)
* [OS Concepts Used](#-5-os-concepts-used)
* [Limitations](#-6-limitations-honest-reality-check)
* [How This Project Can Be Extended](#-7-how-the-project-can-be-extended)
* [How to Run](#-8-how-to-run-this-project)
* [Demo](#-9-demo-behavior)
* [Contributing](#-10-contribution-philosophy)

---
## 📚 Prerequisites  
To understand this project clearly, please read the following explanation first:
Client-Server architecture:
[https://youtu.be/aRUhd1Wd3Sw?si=S8zZGwIbPppt1JnV](https://youtu.be/aRUhd1Wd3Sw?si=S8zZGwIbPppt1JnV)
[https://youtu.be/ofHYRdWQESo?si=8bintVkL-cXRrnjl](https://youtu.be/ofHYRdWQESo?si=8bintVkL-cXRrnjl)

Sockets:
[https://chatgpt.com/share/691b35b0-f0bc-8009-a33c-5459d0ffb512](https://chatgpt.com/share/691b35b0-f0bc-8009-a33c-5459d0ffb512)

Make file:
[https://chatgpt.com/s/t_691b3770c2a481918d4c7a648907d428](https://chatgpt.com/s/t_691b3770c2a481918d4c7a648907d428)



## 🌐 **1. Introduction — What Is a Proxy Server?**

[Back to Top](#-multi-threaded-proxy-server-with--without-cache--explained-in-simple-story-format)

Imagine typing:

```
www.cs.princeton.edu
```

Your browser sends a request → travels across the internet → reaches the real server → server responds.

Now imagine **thousands** of people doing this simultaneously.
Servers overload. Bandwidth is wasted. Websites slow down.

This is where a **Proxy Server** steps in.

A proxy acts as a **middle-man**:

```
Client (Browser) ↔ Proxy ↔ Real Website Server
```

A proxy can:

* Forward your request
* Fetch the response
* Send it back
* Cache it for faster next-time access
* Hide your IP
* Restrict certain websites

Your project builds exactly this — using **C, threads, semaphores, sockets, and LRU Cache**.

---

## 🛠 **2. Why Build This Project? (Motivation)**

[Back to Top](#-multi-threaded-proxy-server-with--without-cache--explained-in-simple-story-format)

To understand real-world concepts such as:

* How browsers communicate with servers
* How servers handle **multiple clients** (concurrency)
* How semaphores & locks **avoid race conditions**
* How caching improves speed
* Why proxies are crucial in real networking & security

Your project is basically a **mini real-world proxy** that teaches almost everything happening behind the curtains.

---

## 🔁 **3. Basic Working of Your Proxy — Story Flow**

[Back to Top](#-multi-threaded-proxy-server-with--without-cache--explained-in-simple-story-format)

### **STEP 1 — Browser Sends Request**

User types a URL → Browser sends HTTP request → Proxy receives it.

### **STEP 2 — Proxy Creates a Thread**

Each request is handled by a **separate worker thread**.

### **STEP 3 — Cache Check**

* **Cache MISS** → Proxy fetches from real server → stores in cache
* **Cache HIT** → Proxy instantly serves from memory

This is *exactly how Chrome/Firefox does caching*.

### **STEP 4 — Result Sent Back**

Client receives response → displays website → thread completes.

---

## 🧵 **4. How Multi-Threading Is Implemented**

[Back to Top](#-multi-threaded-proxy-server-with--without-cache--explained-in-simple-story-format)

Most beginners use:

* `pthread_create()`
* `pthread_join()`
* `pthread_exit()`

But `pthread_join()` requires tracking thread IDs — messy.

Your project uses **Semaphores**, making life easy:

| Operation    | Meaning                        |
| ------------ | ------------------------------ |
| `sem_wait()` | Thread waits until allowed     |
| `sem_post()` | Thread signals it has finished |

✔ No need to store thread IDs
✔ Cleaner flow
✔ Better control over concurrency

---

## ⚡ **5. OS Concepts Used**

[Back to Top](#-multi-threaded-proxy-server-with--without-cache--explained-in-simple-story-format)

* **Threads** — each client handled separately
* **Mutex Locks** — protect shared resources like cache
* **Semaphores** — coordinate worker threads
* **LRU Cache** — evicts least recently used items

This project touches nearly every major OS practical concept.

> **Note:**
> This project includes enhancements, restructuring, and clarity improvements added on top of the original MIT-licensed proxy server implementation available at:
> [https://github.com/AlphaDecodeX/MultiThreadedProxyServerClient](https://github.com/AlphaDecodeX/MultiThreadedProxyServerClient)

---

## 📉 **6. Limitations (Honest Reality Check)**

[Back to Top](#-multi-threaded-proxy-server-with--without-cache--explained-in-simple-story-format)

* Some websites load multiple internal resources → cache stores each as separate chunks
* Fixed cache size → large sites might not fully fit

Perfectly acceptable for a learning-level proxy.

---

## 🚀 **7. How the Project Can Be Extended**

[Back to Top](#-multi-threaded-proxy-server-with--without-cache--explained-in-simple-story-format)

You can add:

* Multiprocessing for true parallelism
* Website blocking (parental control style)
* Support for POST & other methods
* HTTPS interception (advanced MITM)
* Smarter dynamic caching

---

## 🧾 **8. How to Run This Project**

[Back to Top](#-multi-threaded-proxy-server-with--without-cache--explained-in-simple-story-format)

```bash
$ git clone https://github.com/Sricharan-2690/MultiThreadedProxyServerClient.git
$ cd MultiThreadedProxyServerClient
$ make all
$ ./proxy <port>
```

Open in browser:

```
http://localhost:<port>/https://www.cs.princeton.edu/
```

### **Important Notes**

* Works only on **Linux**
* Disable browser cache while testing
* To run without cache → rename `.c` file in Makefile

---

## 🪄 **9. Demo Behavior**

[Back to Top](#-multi-threaded-proxy-server-with--without-cache--explained-in-simple-story-format)

* First visit → **CACHE MISS**
* Second visit → **CACHE HIT** (super fast)

![](https://github.com/Lovepreet-Singh-LPSK/MultiThreadedProxyServerClient/blob/main/pics/cache.png)

---

## 🤝 **10. Contribution Philosophy**

[Back to Top](#-multi-threaded-proxy-server-with--without-cache--explained-in-simple-story-format)

Anyone is welcome to:

* Extend caching
* Add new HTTP features
* Improve thread handling
* Add filters / security layers

Submit a PR here:

👉 **[https://github.com/Sricharan-2690/MultiThreadedProxyServerClient](https://github.com/Sricharan-2690/MultiThreadedProxyServerClient)**

---
