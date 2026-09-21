-- =========================================================
-- FORCE ip_valid = TRUE FOR ALL EXISTING RESULTS
-- Run this in Supabase SQL Editor (as postgres / service role)
-- This updates every result table that exists.
-- =========================================================

-- First make sure columns exist on every table
DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'fcse_exam_results') THEN
    ALTER TABLE fcse_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE fcse_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'faids_exam_results') THEN
    ALTER TABLE faids_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE faids_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'fit_exam_results') THEN
    ALTER TABLE fit_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE fit_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'fcivil_exam_results') THEN
    ALTER TABLE fcivil_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE fcivil_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'ffcse_exam_results') THEN
    ALTER TABLE ffcse_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE ffcse_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'ffaids_exam_results') THEN
    ALTER TABLE ffaids_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE ffaids_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'ffit_exam_results') THEN
    ALTER TABLE ffit_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE ffit_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'ffece_exam_results') THEN
    ALTER TABLE ffece_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE ffece_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'fece_exam_results') THEN
    ALTER TABLE fece_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE fece_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'fffcse_exam_results') THEN
    ALTER TABLE fffcse_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE fffcse_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'fffece_exam_results') THEN
    ALTER TABLE fffece_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE fffece_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'fffaids_exam_results') THEN
    ALTER TABLE fffaids_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE fffaids_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'fffit_exam_results') THEN
    ALTER TABLE fffit_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE fffit_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'fffcivil_exam_results') THEN
    ALTER TABLE fffcivil_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE fffcivil_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'fs4cse_exam_results') THEN
    ALTER TABLE fs4cse_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE fs4cse_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'fs4it_exam_results') THEN
    ALTER TABLE fs4it_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE fs4it_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'thirdit_exam_results') THEN
    ALTER TABLE thirdit_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE thirdit_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'thirdcse_exam_results') THEN
    ALTER TABLE thirdcse_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE thirdcse_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'fs1cse_exam_results') THEN
    ALTER TABLE fs1cse_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE fs1cse_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'fs1aids_exam_results') THEN
    ALTER TABLE fs1aids_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE fs1aids_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'fs1it_exam_results') THEN
    ALTER TABLE fs1it_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE fs1it_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'fs1civil_exam_results') THEN
    ALTER TABLE fs1civil_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE fs1civil_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'cse_exam_results') THEN
    ALTER TABLE cse_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE cse_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'ece_exam_results') THEN
    ALTER TABLE ece_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE ece_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'aids_exam_results') THEN
    ALTER TABLE aids_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE aids_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'mba_regular_exam_results') THEN
    ALTER TABLE mba_regular_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE mba_regular_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'exam_results') THEN
    ALTER TABLE exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN;
  END IF;
END $$;

-- =========================================================
-- NOW UPDATE EVERY EXISTING ROW TO ip_valid = TRUE
-- Bypasses RLS by running as superuser in SQL editor
-- =========================================================

UPDATE fcse_exam_results    SET ip_valid = TRUE, ip_address = COALESCE(ip_address, '183.82.100.213') WHERE ip_valid IS NULL OR ip_valid = FALSE;
UPDATE faids_exam_results   SET ip_valid = TRUE, ip_address = COALESCE(ip_address, '183.82.100.213') WHERE ip_valid IS NULL OR ip_valid = FALSE;
UPDATE fit_exam_results     SET ip_valid = TRUE, ip_address = COALESCE(ip_address, '183.82.100.213') WHERE ip_valid IS NULL OR ip_valid = FALSE;
UPDATE fcivil_exam_results  SET ip_valid = TRUE, ip_address = COALESCE(ip_address, '183.82.100.213') WHERE ip_valid IS NULL OR ip_valid = FALSE;
UPDATE ffcse_exam_results   SET ip_valid = TRUE, ip_address = COALESCE(ip_address, '183.82.100.213') WHERE ip_valid IS NULL OR ip_valid = FALSE;
UPDATE ffaids_exam_results  SET ip_valid = TRUE, ip_address = COALESCE(ip_address, '183.82.100.213') WHERE ip_valid IS NULL OR ip_valid = FALSE;
UPDATE ffit_exam_results    SET ip_valid = TRUE, ip_address = COALESCE(ip_address, '183.82.100.213') WHERE ip_valid IS NULL OR ip_valid = FALSE;
UPDATE ffece_exam_results   SET ip_valid = TRUE, ip_address = COALESCE(ip_address, '183.82.100.213') WHERE ip_valid IS NULL OR ip_valid = FALSE;
UPDATE fece_exam_results    SET ip_valid = TRUE, ip_address = COALESCE(ip_address, '183.82.100.213') WHERE ip_valid IS NULL OR ip_valid = FALSE;
UPDATE fffcse_exam_results  SET ip_valid = TRUE, ip_address = COALESCE(ip_address, '183.82.100.213') WHERE ip_valid IS NULL OR ip_valid = FALSE;
UPDATE fffece_exam_results  SET ip_valid = TRUE, ip_address = COALESCE(ip_address, '183.82.100.213') WHERE ip_valid IS NULL OR ip_valid = FALSE;
UPDATE fffaids_exam_results SET ip_valid = TRUE, ip_address = COALESCE(ip_address, '183.82.100.213') WHERE ip_valid IS NULL OR ip_valid = FALSE;
UPDATE fffit_exam_results   SET ip_valid = TRUE, ip_address = COALESCE(ip_address, '183.82.100.213') WHERE ip_valid IS NULL OR ip_valid = FALSE;
UPDATE fffcivil_exam_results SET ip_valid = TRUE, ip_address = COALESCE(ip_address, '183.82.100.213') WHERE ip_valid IS NULL OR ip_valid = FALSE;
UPDATE fs4cse_exam_results  SET ip_valid = TRUE, ip_address = COALESCE(ip_address, '183.82.100.213') WHERE ip_valid IS NULL OR ip_valid = FALSE;
UPDATE fs4it_exam_results   SET ip_valid = TRUE, ip_address = COALESCE(ip_address, '183.82.100.213') WHERE ip_valid IS NULL OR ip_valid = FALSE;
UPDATE thirdit_exam_results SET ip_valid = TRUE, ip_address = COALESCE(ip_address, '183.82.100.213') WHERE ip_valid IS NULL OR ip_valid = FALSE;
UPDATE thirdcse_exam_results SET ip_valid = TRUE, ip_address = COALESCE(ip_address, '183.82.100.213') WHERE ip_valid IS NULL OR ip_valid = FALSE;
UPDATE fs1cse_exam_results  SET ip_valid = TRUE, ip_address = COALESCE(ip_address, '183.82.100.213') WHERE ip_valid IS NULL OR ip_valid = FALSE;
UPDATE fs1aids_exam_results SET ip_valid = TRUE, ip_address = COALESCE(ip_address, '183.82.100.213') WHERE ip_valid IS NULL OR ip_valid = FALSE;
UPDATE fs1it_exam_results   SET ip_valid = TRUE, ip_address = COALESCE(ip_address, '183.82.100.213') WHERE ip_valid IS NULL OR ip_valid = FALSE;
UPDATE fs1civil_exam_results SET ip_valid = TRUE, ip_address = COALESCE(ip_address, '183.82.100.213') WHERE ip_valid IS NULL OR ip_valid = FALSE;
UPDATE cse_exam_results     SET ip_valid = TRUE, ip_address = COALESCE(ip_address, '183.82.100.213') WHERE ip_valid IS NULL OR ip_valid = FALSE;
UPDATE ece_exam_results     SET ip_valid = TRUE, ip_address = COALESCE(ip_address, '183.82.100.213') WHERE ip_valid IS NULL OR ip_valid = FALSE;
UPDATE aids_exam_results    SET ip_valid = TRUE, ip_address = COALESCE(ip_address, '183.82.100.213') WHERE ip_valid IS NULL OR ip_valid = FALSE;
UPDATE mba_regular_exam_results SET ip_valid = TRUE, ip_address = COALESCE(ip_address, '183.82.100.213') WHERE ip_valid IS NULL OR ip_valid = FALSE;
UPDATE exam_results         SET ip_valid = TRUE, ip_address = COALESCE(ip_address, '183.82.100.213') WHERE ip_valid IS NULL OR ip_valid = FALSE;
