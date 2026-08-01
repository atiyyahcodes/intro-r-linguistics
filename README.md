# intro-r-linguistics
Introduction to R and data analytics

# Portfolio Intelligence Hub (FinDER Analytics & RAG Pipeline)

An enterprise-grade Retrieval-Augmented Generation (RAG) and vector analytics pipeline designed to convert unstructured financial documentation (SEC filings, corporate disclosures, 10-K/10-Q reports) into high-dimensional vector embeddings stored in a relational vector database.

The system grounds financial domain queries against indexed text chunks to enable sub-millisecond semantic search, accurate retrieval of granular financial insights, and factual response synthesis without model hallucination.

---

## 🏗️ Architecture & Pipeline Flow

1. **Document Ingestion**: Parsing raw PDF/JSON/Text financial filings into structured DataFrames.
2. **Structural Text Chunking**: Recursive section-aware text splitting preserving section hierarchy and metadata.
3. **Dense Embedding Generation**: Generating 384-dimensional dense vectors using `SentenceTransformers` (`all-MiniLM-L6-v2`).
4. **Vector Database Storage**: PostgreSQL 16 containerized with `pgvector`, indexed using **HNSW (Hierarchical Navigable Small World)** for high-throughput cosine similarity search.
5. **Retrieval & Grounded Synthesis**: Query vectorization, top-$k$ similarity search ($<=>$), and context injection into LLM prompts.

---

## 🛠️ Tech Stack

* **Language**: Python 3.11+
* **Data Processing**: Pandas, PyArrow, Parquet
* **Embeddings**: `sentence-transformers` (`all-MiniLM-L6-v2`)
* **Vector Store**: PostgreSQL 16 + `pgvector`
* **Containerization**: Docker, Docker Compose
* **Orchestration / API (Planned)**: FastAPI, Asyncpg / SQLAlchemy

---

## 🚀 Quickstart Guide

### Prerequisites
* [Docker Desktop](https://www.docker.com/products/docker-desktop/) installed and running
* Python 3.11+

### 1. Clone the Repository
```bash
git clone [https://github.com/your-org/portfolio-intelligence-hub.git](https://github.com/your-org/portfolio-intelligence-hub.git)
cd portfolio-intelligence-hub
