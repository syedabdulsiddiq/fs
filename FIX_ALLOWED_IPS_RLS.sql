-- =========================================================
-- FIX allowed_ips TABLE: ensure RLS allows anon reads
-- and correct IPs are stored
-- Run this in Supabase SQL Editor
-- =========================================================

-- Make sure table exists
CREATE TABLE IF NOT EXISTS allowed_ips (
    id BIGSERIAL PRIMARY KEY,
    ip_address TEXT UNIQUE NOT NULL,
    description TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Clear and re-insert to avoid any whitespace/encoding issues
DELETE FROM allowed_ips;
INSERT INTO allowed_ips (ip_address, description) VALUES
    ('183.82.100.213', 'Authorized exam center IP 1'),
    ('183.82.100.21',  'Authorized exam center IP 2');

-- Enable RLS
ALTER TABLE allowed_ips ENABLE ROW LEVEL SECURITY;

-- Drop old policy if exists and recreate cleanly
DROP POLICY IF EXISTS "Allow public read allowed_ips" ON allowed_ips;
CREATE POLICY "Allow public read allowed_ips"
ON allowed_ips FOR SELECT
TO anon, authenticated
USING (true);

-- Verify
SELECT * FROM allowed_ips;
