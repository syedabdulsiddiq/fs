-- =========================================================
-- REMOVE ip_address COLUMN from all F, FF, FFF result tables
-- KEEP ip_valid column
-- Each block checks table exists first - safe to run multiple times
-- =========================================================

DO $$ BEGIN IF EXISTS (SELECT FROM information_schema.columns WHERE table_name = 'fcse_exam_results' AND column_name = 'ip_address') THEN
  ALTER TABLE fcse_exam_results DROP COLUMN ip_address;
END IF; END $$;

DO $$ BEGIN IF EXISTS (SELECT FROM information_schema.columns WHERE table_name = 'faids_exam_results' AND column_name = 'ip_address') THEN
  ALTER TABLE faids_exam_results DROP COLUMN ip_address;
END IF; END $$;

DO $$ BEGIN IF EXISTS (SELECT FROM information_schema.columns WHERE table_name = 'fit_exam_results' AND column_name = 'ip_address') THEN
  ALTER TABLE fit_exam_results DROP COLUMN ip_address;
END IF; END $$;

DO $$ BEGIN IF EXISTS (SELECT FROM information_schema.columns WHERE table_name = 'fcivil_exam_results' AND column_name = 'ip_address') THEN
  ALTER TABLE fcivil_exam_results DROP COLUMN ip_address;
END IF; END $$;

DO $$ BEGIN IF EXISTS (SELECT FROM information_schema.columns WHERE table_name = 'ffcse_exam_results' AND column_name = 'ip_address') THEN
  ALTER TABLE ffcse_exam_results DROP COLUMN ip_address;
END IF; END $$;

DO $$ BEGIN IF EXISTS (SELECT FROM information_schema.columns WHERE table_name = 'ffaids_exam_results' AND column_name = 'ip_address') THEN
  ALTER TABLE ffaids_exam_results DROP COLUMN ip_address;
END IF; END $$;

DO $$ BEGIN IF EXISTS (SELECT FROM information_schema.columns WHERE table_name = 'ffit_exam_results' AND column_name = 'ip_address') THEN
  ALTER TABLE ffit_exam_results DROP COLUMN ip_address;
END IF; END $$;

DO $$ BEGIN IF EXISTS (SELECT FROM information_schema.columns WHERE table_name = 'ffece_exam_results' AND column_name = 'ip_address') THEN
  ALTER TABLE ffece_exam_results DROP COLUMN ip_address;
END IF; END $$;

DO $$ BEGIN IF EXISTS (SELECT FROM information_schema.columns WHERE table_name = 'fece_exam_results' AND column_name = 'ip_address') THEN
  ALTER TABLE fece_exam_results DROP COLUMN ip_address;
END IF; END $$;

DO $$ BEGIN IF EXISTS (SELECT FROM information_schema.columns WHERE table_name = 'fffcse_exam_results' AND column_name = 'ip_address') THEN
  ALTER TABLE fffcse_exam_results DROP COLUMN ip_address;
END IF; END $$;

DO $$ BEGIN IF EXISTS (SELECT FROM information_schema.columns WHERE table_name = 'fffece_exam_results' AND column_name = 'ip_address') THEN
  ALTER TABLE fffece_exam_results DROP COLUMN ip_address;
END IF; END $$;

DO $$ BEGIN IF EXISTS (SELECT FROM information_schema.columns WHERE table_name = 'fffaids_exam_results' AND column_name = 'ip_address') THEN
  ALTER TABLE fffaids_exam_results DROP COLUMN ip_address;
END IF; END $$;

DO $$ BEGIN IF EXISTS (SELECT FROM information_schema.columns WHERE table_name = 'fffit_exam_results' AND column_name = 'ip_address') THEN
  ALTER TABLE fffit_exam_results DROP COLUMN ip_address;
END IF; END $$;

DO $$ BEGIN IF EXISTS (SELECT FROM information_schema.columns WHERE table_name = 'fffcivil_exam_results' AND column_name = 'ip_address') THEN
  ALTER TABLE fffcivil_exam_results DROP COLUMN ip_address;
END IF; END $$;

DO $$ BEGIN IF EXISTS (SELECT FROM information_schema.columns WHERE table_name = 'fs4cse_exam_results' AND column_name = 'ip_address') THEN
  ALTER TABLE fs4cse_exam_results DROP COLUMN ip_address;
END IF; END $$;

DO $$ BEGIN IF EXISTS (SELECT FROM information_schema.columns WHERE table_name = 'fs4it_exam_results' AND column_name = 'ip_address') THEN
  ALTER TABLE fs4it_exam_results DROP COLUMN ip_address;
END IF; END $$;

DO $$ BEGIN IF EXISTS (SELECT FROM information_schema.columns WHERE table_name = 'thirdit_exam_results' AND column_name = 'ip_address') THEN
  ALTER TABLE thirdit_exam_results DROP COLUMN ip_address;
END IF; END $$;

DO $$ BEGIN IF EXISTS (SELECT FROM information_schema.columns WHERE table_name = 'thirdcse_exam_results' AND column_name = 'ip_address') THEN
  ALTER TABLE thirdcse_exam_results DROP COLUMN ip_address;
END IF; END $$;

DO $$ BEGIN IF EXISTS (SELECT FROM information_schema.columns WHERE table_name = 'fs1cse_exam_results' AND column_name = 'ip_address') THEN
  ALTER TABLE fs1cse_exam_results DROP COLUMN ip_address;
END IF; END $$;

DO $$ BEGIN IF EXISTS (SELECT FROM information_schema.columns WHERE table_name = 'fs1aids_exam_results' AND column_name = 'ip_address') THEN
  ALTER TABLE fs1aids_exam_results DROP COLUMN ip_address;
END IF; END $$;

DO $$ BEGIN IF EXISTS (SELECT FROM information_schema.columns WHERE table_name = 'fs1it_exam_results' AND column_name = 'ip_address') THEN
  ALTER TABLE fs1it_exam_results DROP COLUMN ip_address;
END IF; END $$;

DO $$ BEGIN IF EXISTS (SELECT FROM information_schema.columns WHERE table_name = 'fs1civil_exam_results' AND column_name = 'ip_address') THEN
  ALTER TABLE fs1civil_exam_results DROP COLUMN ip_address;
END IF; END $$;

DO $$ BEGIN IF EXISTS (SELECT FROM information_schema.columns WHERE table_name = 'cse_exam_results' AND column_name = 'ip_address') THEN
  ALTER TABLE cse_exam_results DROP COLUMN ip_address;
END IF; END $$;

DO $$ BEGIN IF EXISTS (SELECT FROM information_schema.columns WHERE table_name = 'ece_exam_results' AND column_name = 'ip_address') THEN
  ALTER TABLE ece_exam_results DROP COLUMN ip_address;
END IF; END $$;

DO $$ BEGIN IF EXISTS (SELECT FROM information_schema.columns WHERE table_name = 'aids_exam_results' AND column_name = 'ip_address') THEN
  ALTER TABLE aids_exam_results DROP COLUMN ip_address;
END IF; END $$;

DO $$ BEGIN IF EXISTS (SELECT FROM information_schema.columns WHERE table_name = 'mba_regular_exam_results' AND column_name = 'ip_address') THEN
  ALTER TABLE mba_regular_exam_results DROP COLUMN ip_address;
END IF; END $$;

DO $$ BEGIN IF EXISTS (SELECT FROM information_schema.columns WHERE table_name = 'exam_results' AND column_name = 'ip_address') THEN
  ALTER TABLE exam_results DROP COLUMN ip_address;
END IF; END $$;
