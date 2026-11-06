-- Enable the vector extension
CREATE EXTENSION IF NOT EXISTS vector;

-- Create table for storing financial text chunks and dense embeddings
CREATE TABLE IF NOT EXISTS document_embeddings (
    id BIGSERIAL PRIMARY KEY,
    doc_id VARCHAR(100) NOT NULL,          -- e.g., 'FIN_Q3_2025_10Q'
    chunk_id VARCHAR(100) NOT NULL,        -- e.g., 'chk_98234'
    chunk_text TEXT NOT NULL,              -- Text snippet content
    page_number INT,                       -- Source pagination
    created_at TIMESTAMP WITH TIMEZONE DEFAULT CURRENT_TIMESTAMP,
    embedding vector(384)                  -- 384-dim dense vector (SentenceTransformers)
);

-- Build HNSW index for fast approximate nearest neighbor (ANN) search
CREATE INDEX IF NOT EXISTS idx_document_embeddings_hnsw 
ON document_embeddings 
USING hnsw (embedding vector_cosine_ops)
WITH (m = 16, ef_construction = 64);
