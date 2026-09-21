-- =========================================================
-- IP VALIDATION SYSTEM
-- 1. allowed_ips table - stores trusted IP addresses
-- 2. Add ip_address + ip_valid columns to all result tables
--    (only if the table exists - safe to run multiple times)
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

-- Allow anonymous/authenticated to read
DROP POLICY IF EXISTS "Allow public read allowed_ips" ON allowed_ips;
CREATE POLICY "Allow public read allowed_ips"
ON allowed_ips FOR SELECT
TO anon, authenticated
USING (true);


-- =========================================================
-- 2. ADD ip_address AND ip_valid TO EACH RESULT TABLE
--    Each block checks IF the table exists before altering.
-- =========================================================

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'exam_results') THEN
    ALTER TABLE exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN NOT NULL DEFAULT TRUE;
    UPDATE exam_results SET ip_valid = TRUE WHERE ip_valid IS NULL OR ip_valid = FALSE;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'mba_regular_exam_results') THEN
    ALTER TABLE mba_regular_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE mba_regular_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN NOT NULL DEFAULT TRUE;
    UPDATE mba_regular_exam_results SET ip_valid = TRUE WHERE ip_valid IS NULL OR ip_valid = FALSE;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'cse_exam_results') THEN
    ALTER TABLE cse_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE cse_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN NOT NULL DEFAULT TRUE;
    UPDATE cse_exam_results SET ip_valid = TRUE WHERE ip_valid IS NULL OR ip_valid = FALSE;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'ece_exam_results') THEN
    ALTER TABLE ece_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE ece_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN NOT NULL DEFAULT TRUE;
    UPDATE ece_exam_results SET ip_valid = TRUE WHERE ip_valid IS NULL OR ip_valid = FALSE;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'aids_exam_results') THEN
    ALTER TABLE aids_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE aids_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN NOT NULL DEFAULT TRUE;
    UPDATE aids_exam_results SET ip_valid = TRUE WHERE ip_valid IS NULL OR ip_valid = FALSE;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'thirdcse_exam_results') THEN
    ALTER TABLE thirdcse_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE thirdcse_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN NOT NULL DEFAULT TRUE;
    UPDATE thirdcse_exam_results SET ip_valid = TRUE WHERE ip_valid IS NULL OR ip_valid = FALSE;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'thirdit_exam_results') THEN
    ALTER TABLE thirdit_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE thirdit_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN NOT NULL DEFAULT TRUE;
    UPDATE thirdit_exam_results SET ip_valid = TRUE WHERE ip_valid IS NULL OR ip_valid = FALSE;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'fs1cse_exam_results') THEN
    ALTER TABLE fs1cse_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE fs1cse_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN NOT NULL DEFAULT TRUE;
    UPDATE fs1cse_exam_results SET ip_valid = TRUE WHERE ip_valid IS NULL OR ip_valid = FALSE;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'fs1aids_exam_results') THEN
    ALTER TABLE fs1aids_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE fs1aids_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN NOT NULL DEFAULT TRUE;
    UPDATE fs1aids_exam_results SET ip_valid = TRUE WHERE ip_valid IS NULL OR ip_valid = FALSE;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'fs1it_exam_results') THEN
    ALTER TABLE fs1it_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE fs1it_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN NOT NULL DEFAULT TRUE;
    UPDATE fs1it_exam_results SET ip_valid = TRUE WHERE ip_valid IS NULL OR ip_valid = FALSE;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'fs1civil_exam_results') THEN
    ALTER TABLE fs1civil_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE fs1civil_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN NOT NULL DEFAULT TRUE;
    UPDATE fs1civil_exam_results SET ip_valid = TRUE WHERE ip_valid IS NULL OR ip_valid = FALSE;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'fcse_exam_results') THEN
    ALTER TABLE fcse_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE fcse_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN NOT NULL DEFAULT TRUE;
    UPDATE fcse_exam_results SET ip_valid = TRUE WHERE ip_valid IS NULL OR ip_valid = FALSE;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'faids_exam_results') THEN
    ALTER TABLE faids_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE faids_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN NOT NULL DEFAULT TRUE;
    UPDATE faids_exam_results SET ip_valid = TRUE WHERE ip_valid IS NULL OR ip_valid = FALSE;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'fit_exam_results') THEN
    ALTER TABLE fit_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE fit_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN NOT NULL DEFAULT TRUE;
    UPDATE fit_exam_results SET ip_valid = TRUE WHERE ip_valid IS NULL OR ip_valid = FALSE;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'fcivil_exam_results') THEN
    ALTER TABLE fcivil_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE fcivil_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN NOT NULL DEFAULT TRUE;
    UPDATE fcivil_exam_results SET ip_valid = TRUE WHERE ip_valid IS NULL OR ip_valid = FALSE;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'ffcse_exam_results') THEN
    ALTER TABLE ffcse_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE ffcse_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN NOT NULL DEFAULT TRUE;
    UPDATE ffcse_exam_results SET ip_valid = TRUE WHERE ip_valid IS NULL OR ip_valid = FALSE;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'ffit_exam_results') THEN
    ALTER TABLE ffit_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE ffit_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN NOT NULL DEFAULT TRUE;
    UPDATE ffit_exam_results SET ip_valid = TRUE WHERE ip_valid IS NULL OR ip_valid = FALSE;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'ffaids_exam_results') THEN
    ALTER TABLE ffaids_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE ffaids_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN NOT NULL DEFAULT TRUE;
    UPDATE ffaids_exam_results SET ip_valid = TRUE WHERE ip_valid IS NULL OR ip_valid = FALSE;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'ffece_exam_results') THEN
    ALTER TABLE ffece_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE ffece_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN NOT NULL DEFAULT TRUE;
    UPDATE ffece_exam_results SET ip_valid = TRUE WHERE ip_valid IS NULL OR ip_valid = FALSE;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'fffcse_exam_results') THEN
    ALTER TABLE fffcse_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE fffcse_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN NOT NULL DEFAULT TRUE;
    UPDATE fffcse_exam_results SET ip_valid = TRUE WHERE ip_valid IS NULL OR ip_valid = FALSE;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'fffece_exam_results') THEN
    ALTER TABLE fffece_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE fffece_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN NOT NULL DEFAULT TRUE;
    UPDATE fffece_exam_results SET ip_valid = TRUE WHERE ip_valid IS NULL OR ip_valid = FALSE;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'fffaids_exam_results') THEN
    ALTER TABLE fffaids_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE fffaids_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN NOT NULL DEFAULT TRUE;
    UPDATE fffaids_exam_results SET ip_valid = TRUE WHERE ip_valid IS NULL OR ip_valid = FALSE;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'fffit_exam_results') THEN
    ALTER TABLE fffit_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE fffit_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN NOT NULL DEFAULT TRUE;
    UPDATE fffit_exam_results SET ip_valid = TRUE WHERE ip_valid IS NULL OR ip_valid = FALSE;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'fffcivil_exam_results') THEN
    ALTER TABLE fffcivil_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE fffcivil_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN NOT NULL DEFAULT TRUE;
    UPDATE fffcivil_exam_results SET ip_valid = TRUE WHERE ip_valid IS NULL OR ip_valid = FALSE;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'fs4cse_exam_results') THEN
    ALTER TABLE fs4cse_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE fs4cse_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN NOT NULL DEFAULT TRUE;
    UPDATE fs4cse_exam_results SET ip_valid = TRUE WHERE ip_valid IS NULL OR ip_valid = FALSE;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'fs4it_exam_results') THEN
    ALTER TABLE fs4it_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE fs4it_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN NOT NULL DEFAULT TRUE;
    UPDATE fs4it_exam_results SET ip_valid = TRUE WHERE ip_valid IS NULL OR ip_valid = FALSE;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'fece_exam_results') THEN
    ALTER TABLE fece_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE fece_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN NOT NULL DEFAULT TRUE;
    UPDATE fece_exam_results SET ip_valid = TRUE WHERE ip_valid IS NULL OR ip_valid = FALSE;
  END IF;
END $$;
