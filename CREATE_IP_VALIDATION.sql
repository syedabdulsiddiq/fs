-- =========================================================
-- IP VALIDATION SYSTEM
-- 1. allowed_ips table - stores trusted IP addresses
-- 2. Add ip_address + ip_valid columns to all result tables
-- 3. Set all existing rows to ip_valid = TRUE
-- =========================================================


-- =========================================================
-- 1. ALLOWED IPs TABLE
-- =========================================================
CREATE TABLE IF NOT EXISTS allowed_ips (
    id BIGSERIAL PRIMARY KEY,
    ip_address TEXT UNIQUE NOT NULL,
    description TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Insert the two trusted IPs
INSERT INTO allowed_ips (ip_address, description)
VALUES
    ('183.82.100.213', 'Authorized exam center IP'),
    ('183.82.100.21',  'Authorized exam center IP 2')
ON CONFLICT (ip_address) DO NOTHING;

-- Enable RLS
ALTER TABLE allowed_ips ENABLE ROW LEVEL SECURITY;

-- Allow anonymous/authenticated to read (needed for client-side validation)
DROP POLICY IF EXISTS "Allow public read allowed_ips" ON allowed_ips;
CREATE POLICY "Allow public read allowed_ips"
ON allowed_ips FOR SELECT
TO anon, authenticated
USING (true);


-- =========================================================
-- 2. ADD ip_address AND ip_valid COLUMNS TO ALL RESULT TABLES
--    (IF NOT EXISTS guards make these safe to run multiple times)
-- =========================================================

ALTER TABLE exam_results              ADD COLUMN IF NOT EXISTS ip_address TEXT;
ALTER TABLE exam_results              ADD COLUMN IF NOT EXISTS ip_valid   BOOLEAN NOT NULL DEFAULT TRUE;

ALTER TABLE mba_regular_exam_results  ADD COLUMN IF NOT EXISTS ip_address TEXT;
ALTER TABLE mba_regular_exam_results  ADD COLUMN IF NOT EXISTS ip_valid   BOOLEAN NOT NULL DEFAULT TRUE;

ALTER TABLE cse_exam_results          ADD COLUMN IF NOT EXISTS ip_address TEXT;
ALTER TABLE cse_exam_results          ADD COLUMN IF NOT EXISTS ip_valid   BOOLEAN NOT NULL DEFAULT TRUE;

ALTER TABLE ece_exam_results          ADD COLUMN IF NOT EXISTS ip_address TEXT;
ALTER TABLE ece_exam_results          ADD COLUMN IF NOT EXISTS ip_valid   BOOLEAN NOT NULL DEFAULT TRUE;

ALTER TABLE aids_exam_results         ADD COLUMN IF NOT EXISTS ip_address TEXT;
ALTER TABLE aids_exam_results         ADD COLUMN IF NOT EXISTS ip_valid   BOOLEAN NOT NULL DEFAULT TRUE;

ALTER TABLE thirdcse_exam_results     ADD COLUMN IF NOT EXISTS ip_address TEXT;
ALTER TABLE thirdcse_exam_results     ADD COLUMN IF NOT EXISTS ip_valid   BOOLEAN NOT NULL DEFAULT TRUE;

ALTER TABLE thirdit_exam_results      ADD COLUMN IF NOT EXISTS ip_address TEXT;
ALTER TABLE thirdit_exam_results      ADD COLUMN IF NOT EXISTS ip_valid   BOOLEAN NOT NULL DEFAULT TRUE;

ALTER TABLE fs1cse_exam_results       ADD COLUMN IF NOT EXISTS ip_address TEXT;
ALTER TABLE fs1cse_exam_results       ADD COLUMN IF NOT EXISTS ip_valid   BOOLEAN NOT NULL DEFAULT TRUE;

ALTER TABLE fs1aids_exam_results      ADD COLUMN IF NOT EXISTS ip_address TEXT;
ALTER TABLE fs1aids_exam_results      ADD COLUMN IF NOT EXISTS ip_valid   BOOLEAN NOT NULL DEFAULT TRUE;

ALTER TABLE fs1it_exam_results        ADD COLUMN IF NOT EXISTS ip_address TEXT;
ALTER TABLE fs1it_exam_results        ADD COLUMN IF NOT EXISTS ip_valid   BOOLEAN NOT NULL DEFAULT TRUE;

ALTER TABLE fs1civil_exam_results     ADD COLUMN IF NOT EXISTS ip_address TEXT;
ALTER TABLE fs1civil_exam_results     ADD COLUMN IF NOT EXISTS ip_valid   BOOLEAN NOT NULL DEFAULT TRUE;

ALTER TABLE fcse_exam_results         ADD COLUMN IF NOT EXISTS ip_address TEXT;
ALTER TABLE fcse_exam_results         ADD COLUMN IF NOT EXISTS ip_valid   BOOLEAN NOT NULL DEFAULT TRUE;

ALTER TABLE faids_exam_results        ADD COLUMN IF NOT EXISTS ip_address TEXT;
ALTER TABLE faids_exam_results        ADD COLUMN IF NOT EXISTS ip_valid   BOOLEAN NOT NULL DEFAULT TRUE;

ALTER TABLE fit_exam_results          ADD COLUMN IF NOT EXISTS ip_address TEXT;
ALTER TABLE fit_exam_results          ADD COLUMN IF NOT EXISTS ip_valid   BOOLEAN NOT NULL DEFAULT TRUE;

ALTER TABLE fcivil_exam_results       ADD COLUMN IF NOT EXISTS ip_address TEXT;
ALTER TABLE fcivil_exam_results       ADD COLUMN IF NOT EXISTS ip_valid   BOOLEAN NOT NULL DEFAULT TRUE;

ALTER TABLE ffcse_exam_results        ADD COLUMN IF NOT EXISTS ip_address TEXT;
ALTER TABLE ffcse_exam_results        ADD COLUMN IF NOT EXISTS ip_valid   BOOLEAN NOT NULL DEFAULT TRUE;

ALTER TABLE ffit_exam_results         ADD COLUMN IF NOT EXISTS ip_address TEXT;
ALTER TABLE ffit_exam_results         ADD COLUMN IF NOT EXISTS ip_valid   BOOLEAN NOT NULL DEFAULT TRUE;

ALTER TABLE ffaids_exam_results       ADD COLUMN IF NOT EXISTS ip_address TEXT;
ALTER TABLE ffaids_exam_results       ADD COLUMN IF NOT EXISTS ip_valid   BOOLEAN NOT NULL DEFAULT TRUE;

ALTER TABLE ffece_exam_results        ADD COLUMN IF NOT EXISTS ip_address TEXT;
ALTER TABLE ffece_exam_results        ADD COLUMN IF NOT EXISTS ip_valid   BOOLEAN NOT NULL DEFAULT TRUE;

ALTER TABLE fffcse_exam_results       ADD COLUMN IF NOT EXISTS ip_address TEXT;
ALTER TABLE fffcse_exam_results       ADD COLUMN IF NOT EXISTS ip_valid   BOOLEAN NOT NULL DEFAULT TRUE;

ALTER TABLE fffece_exam_results       ADD COLUMN IF NOT EXISTS ip_address TEXT;
ALTER TABLE fffece_exam_results       ADD COLUMN IF NOT EXISTS ip_valid   BOOLEAN NOT NULL DEFAULT TRUE;

ALTER TABLE fffaids_exam_results      ADD COLUMN IF NOT EXISTS ip_address TEXT;
ALTER TABLE fffaids_exam_results      ADD COLUMN IF NOT EXISTS ip_valid   BOOLEAN NOT NULL DEFAULT TRUE;

ALTER TABLE fffit_exam_results        ADD COLUMN IF NOT EXISTS ip_address TEXT;
ALTER TABLE fffit_exam_results        ADD COLUMN IF NOT EXISTS ip_valid   BOOLEAN NOT NULL DEFAULT TRUE;

ALTER TABLE fffcivil_exam_results     ADD COLUMN IF NOT EXISTS ip_address TEXT;
ALTER TABLE fffcivil_exam_results     ADD COLUMN IF NOT EXISTS ip_valid   BOOLEAN NOT NULL DEFAULT TRUE;

ALTER TABLE fs4cse_exam_results       ADD COLUMN IF NOT EXISTS ip_address TEXT;
ALTER TABLE fs4cse_exam_results       ADD COLUMN IF NOT EXISTS ip_valid   BOOLEAN NOT NULL DEFAULT TRUE;

ALTER TABLE fs4it_exam_results        ADD COLUMN IF NOT EXISTS ip_address TEXT;
ALTER TABLE fs4it_exam_results        ADD COLUMN IF NOT EXISTS ip_valid   BOOLEAN NOT NULL DEFAULT TRUE;

ALTER TABLE fece_exam_results         ADD COLUMN IF NOT EXISTS ip_address TEXT;
ALTER TABLE fece_exam_results         ADD COLUMN IF NOT EXISTS ip_valid   BOOLEAN NOT NULL DEFAULT TRUE;


-- =========================================================
-- 3. SET ALL EXISTING ROWS TO ip_valid = TRUE
--    (backfill - all past results are considered valid)
-- =========================================================

UPDATE exam_results              SET ip_valid = TRUE WHERE ip_valid IS NULL OR ip_valid = FALSE;
UPDATE mba_regular_exam_results  SET ip_valid = TRUE WHERE ip_valid IS NULL OR ip_valid = FALSE;
UPDATE cse_exam_results          SET ip_valid = TRUE WHERE ip_valid IS NULL OR ip_valid = FALSE;
UPDATE ece_exam_results          SET ip_valid = TRUE WHERE ip_valid IS NULL OR ip_valid = FALSE;
UPDATE aids_exam_results         SET ip_valid = TRUE WHERE ip_valid IS NULL OR ip_valid = FALSE;
UPDATE thirdcse_exam_results     SET ip_valid = TRUE WHERE ip_valid IS NULL OR ip_valid = FALSE;
UPDATE thirdit_exam_results      SET ip_valid = TRUE WHERE ip_valid IS NULL OR ip_valid = FALSE;
UPDATE fs1cse_exam_results       SET ip_valid = TRUE WHERE ip_valid IS NULL OR ip_valid = FALSE;
UPDATE fs1aids_exam_results      SET ip_valid = TRUE WHERE ip_valid IS NULL OR ip_valid = FALSE;
UPDATE fs1it_exam_results        SET ip_valid = TRUE WHERE ip_valid IS NULL OR ip_valid = FALSE;
UPDATE fs1civil_exam_results     SET ip_valid = TRUE WHERE ip_valid IS NULL OR ip_valid = FALSE;
UPDATE fcse_exam_results         SET ip_valid = TRUE WHERE ip_valid IS NULL OR ip_valid = FALSE;
UPDATE faids_exam_results        SET ip_valid = TRUE WHERE ip_valid IS NULL OR ip_valid = FALSE;
UPDATE fit_exam_results          SET ip_valid = TRUE WHERE ip_valid IS NULL OR ip_valid = FALSE;
UPDATE fcivil_exam_results       SET ip_valid = TRUE WHERE ip_valid IS NULL OR ip_valid = FALSE;
UPDATE ffcse_exam_results        SET ip_valid = TRUE WHERE ip_valid IS NULL OR ip_valid = FALSE;
UPDATE ffit_exam_results         SET ip_valid = TRUE WHERE ip_valid IS NULL OR ip_valid = FALSE;
UPDATE ffaids_exam_results       SET ip_valid = TRUE WHERE ip_valid IS NULL OR ip_valid = FALSE;
UPDATE ffece_exam_results        SET ip_valid = TRUE WHERE ip_valid IS NULL OR ip_valid = FALSE;
UPDATE fffcse_exam_results       SET ip_valid = TRUE WHERE ip_valid IS NULL OR ip_valid = FALSE;
UPDATE fffece_exam_results       SET ip_valid = TRUE WHERE ip_valid IS NULL OR ip_valid = FALSE;
UPDATE fffaids_exam_results      SET ip_valid = TRUE WHERE ip_valid IS NULL OR ip_valid = FALSE;
UPDATE fffit_exam_results        SET ip_valid = TRUE WHERE ip_valid IS NULL OR ip_valid = FALSE;
UPDATE fffcivil_exam_results     SET ip_valid = TRUE WHERE ip_valid IS NULL OR ip_valid = FALSE;
UPDATE fs4cse_exam_results       SET ip_valid = TRUE WHERE ip_valid IS NULL OR ip_valid = FALSE;
UPDATE fs4it_exam_results        SET ip_valid = TRUE WHERE ip_valid IS NULL OR ip_valid = FALSE;
UPDATE fece_exam_results         SET ip_valid = TRUE WHERE ip_valid IS NULL OR ip_valid = FALSE;
