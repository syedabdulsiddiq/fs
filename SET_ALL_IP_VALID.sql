-- =========================================================
-- SET ALL EXISTING RESULTS TO ip_valid = TRUE
-- Run this in Supabase SQL editor.
-- Each block is independent - skips tables that don't exist.
-- =========================================================

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'exam_results') THEN
    ALTER TABLE exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN;
    UPDATE exam_results SET ip_valid = TRUE;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'mba_regular_exam_results') THEN
    ALTER TABLE mba_regular_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE mba_regular_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN;
    UPDATE mba_regular_exam_results SET ip_valid = TRUE;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'cse_exam_results') THEN
    ALTER TABLE cse_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE cse_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN;
    UPDATE cse_exam_results SET ip_valid = TRUE;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'ece_exam_results') THEN
    ALTER TABLE ece_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE ece_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN;
    UPDATE ece_exam_results SET ip_valid = TRUE;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'aids_exam_results') THEN
    ALTER TABLE aids_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE aids_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN;
    UPDATE aids_exam_results SET ip_valid = TRUE;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'thirdcse_exam_results') THEN
    ALTER TABLE thirdcse_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE thirdcse_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN;
    UPDATE thirdcse_exam_results SET ip_valid = TRUE;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'thirdit_exam_results') THEN
    ALTER TABLE thirdit_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE thirdit_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN;
    UPDATE thirdit_exam_results SET ip_valid = TRUE;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'fs1cse_exam_results') THEN
    ALTER TABLE fs1cse_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE fs1cse_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN;
    UPDATE fs1cse_exam_results SET ip_valid = TRUE;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'fs1aids_exam_results') THEN
    ALTER TABLE fs1aids_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE fs1aids_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN;
    UPDATE fs1aids_exam_results SET ip_valid = TRUE;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'fs1it_exam_results') THEN
    ALTER TABLE fs1it_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE fs1it_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN;
    UPDATE fs1it_exam_results SET ip_valid = TRUE;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'fs1civil_exam_results') THEN
    ALTER TABLE fs1civil_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE fs1civil_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN;
    UPDATE fs1civil_exam_results SET ip_valid = TRUE;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'fcse_exam_results') THEN
    ALTER TABLE fcse_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE fcse_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN;
    UPDATE fcse_exam_results SET ip_valid = TRUE;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'faids_exam_results') THEN
    ALTER TABLE faids_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE faids_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN;
    UPDATE faids_exam_results SET ip_valid = TRUE;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'fit_exam_results') THEN
    ALTER TABLE fit_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE fit_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN;
    UPDATE fit_exam_results SET ip_valid = TRUE;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'fcivil_exam_results') THEN
    ALTER TABLE fcivil_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE fcivil_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN;
    UPDATE fcivil_exam_results SET ip_valid = TRUE;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'ffcse_exam_results') THEN
    ALTER TABLE ffcse_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE ffcse_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN;
    UPDATE ffcse_exam_results SET ip_valid = TRUE;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'ffit_exam_results') THEN
    ALTER TABLE ffit_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE ffit_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN;
    UPDATE ffit_exam_results SET ip_valid = TRUE;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'ffaids_exam_results') THEN
    ALTER TABLE ffaids_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE ffaids_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN;
    UPDATE ffaids_exam_results SET ip_valid = TRUE;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'ffece_exam_results') THEN
    ALTER TABLE ffece_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE ffece_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN;
    UPDATE ffece_exam_results SET ip_valid = TRUE;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'fffcse_exam_results') THEN
    ALTER TABLE fffcse_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE fffcse_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN;
    UPDATE fffcse_exam_results SET ip_valid = TRUE;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'fffece_exam_results') THEN
    ALTER TABLE fffece_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE fffece_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN;
    UPDATE fffece_exam_results SET ip_valid = TRUE;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'fffaids_exam_results') THEN
    ALTER TABLE fffaids_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE fffaids_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN;
    UPDATE fffaids_exam_results SET ip_valid = TRUE;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'fffit_exam_results') THEN
    ALTER TABLE fffit_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE fffit_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN;
    UPDATE fffit_exam_results SET ip_valid = TRUE;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'fffcivil_exam_results') THEN
    ALTER TABLE fffcivil_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE fffcivil_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN;
    UPDATE fffcivil_exam_results SET ip_valid = TRUE;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'fs4cse_exam_results') THEN
    ALTER TABLE fs4cse_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE fs4cse_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN;
    UPDATE fs4cse_exam_results SET ip_valid = TRUE;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'fs4it_exam_results') THEN
    ALTER TABLE fs4it_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE fs4it_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN;
    UPDATE fs4it_exam_results SET ip_valid = TRUE;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'fece_exam_results') THEN
    ALTER TABLE fece_exam_results ADD COLUMN IF NOT EXISTS ip_address TEXT;
    ALTER TABLE fece_exam_results ADD COLUMN IF NOT EXISTS ip_valid BOOLEAN;
    UPDATE fece_exam_results SET ip_valid = TRUE;
  END IF;
END $$;
