-- =========================================================
-- UPDATE ALL RPC SUBMIT FUNCTIONS TO INCLUDE ip_address & ip_valid
-- Run this in Supabase SQL Editor
-- =========================================================


-- =========================================================
-- 1. submit_fffcse_exam_result
-- =========================================================
DROP FUNCTION IF EXISTS submit_fffcse_exam_result(TEXT,INTEGER,INTEGER,INTEGER,NUMERIC,JSONB,JSONB,TEXT,BOOLEAN);
DROP FUNCTION IF EXISTS submit_fffcse_exam_result(TEXT,INTEGER,INTEGER,INTEGER,NUMERIC,JSONB,JSONB,TEXT,BOOLEAN,TEXT,BOOLEAN);

CREATE OR REPLACE FUNCTION submit_fffcse_exam_result(
    p_roll_number TEXT, p_correct_answers INTEGER, p_wrong_answers INTEGER,
    p_total_questions INTEGER, p_percentage NUMERIC, p_user_answers JSONB,
    p_additional_data JSONB, p_violation_type TEXT, p_violation_detected BOOLEAN,
    p_ip_address TEXT DEFAULT NULL, p_ip_valid BOOLEAN DEFAULT FALSE
)
RETURNS TABLE(success BOOLEAN, message TEXT, result_id BIGINT)
LANGUAGE plpgsql SECURITY DEFINER SET search_path = public
AS $$
DECLARE v_student_exists BOOLEAN; v_already_taken BOOLEAN; v_new_id BIGINT;
BEGIN
    SELECT EXISTS(SELECT 1 FROM fffcse_students WHERE roll_number = p_roll_number AND is_active = true) INTO v_student_exists;
    IF NOT v_student_exists THEN RETURN QUERY SELECT false, 'Invalid student'::TEXT, NULL::BIGINT; RETURN; END IF;
    SELECT EXISTS(SELECT 1 FROM fffcse_exam_results WHERE roll_number = p_roll_number) INTO v_already_taken;
    IF v_already_taken THEN RETURN QUERY SELECT false, 'Exam already submitted'::TEXT, NULL::BIGINT; RETURN; END IF;
    BEGIN
        INSERT INTO fffcse_exam_results (roll_number, correct_answers, wrong_answers, total_questions, percentage, user_answers, additional_data, violation_type, violation_detected, ip_address, ip_valid)
        VALUES (p_roll_number, p_correct_answers, p_wrong_answers, p_total_questions, p_percentage, p_user_answers, p_additional_data, p_violation_type, p_violation_detected, p_ip_address, p_ip_valid)
        RETURNING id INTO v_new_id;
        RETURN QUERY SELECT true, 'Exam submitted successfully'::TEXT, v_new_id;
    EXCEPTION
        WHEN unique_violation THEN RETURN QUERY SELECT false, 'Exam already submitted'::TEXT, NULL::BIGINT;
        WHEN OTHERS THEN RETURN QUERY SELECT false, 'Submission failed: ' || SQLERRM, NULL::BIGINT;
    END;
END; $$;


-- =========================================================
-- 2. submit_fffece_exam_result
-- =========================================================
DROP FUNCTION IF EXISTS submit_fffece_exam_result(TEXT,INTEGER,INTEGER,INTEGER,NUMERIC,JSONB,JSONB,TEXT,BOOLEAN);
DROP FUNCTION IF EXISTS submit_fffece_exam_result(TEXT,INTEGER,INTEGER,INTEGER,NUMERIC,JSONB,JSONB,TEXT,BOOLEAN,TEXT,BOOLEAN);

CREATE OR REPLACE FUNCTION submit_fffece_exam_result(
    p_roll_number TEXT, p_correct_answers INTEGER, p_wrong_answers INTEGER,
    p_total_questions INTEGER, p_percentage NUMERIC, p_user_answers JSONB,
    p_additional_data JSONB, p_violation_type TEXT, p_violation_detected BOOLEAN,
    p_ip_address TEXT DEFAULT NULL, p_ip_valid BOOLEAN DEFAULT FALSE
)
RETURNS TABLE(success BOOLEAN, message TEXT, result_id BIGINT)
LANGUAGE plpgsql SECURITY DEFINER SET search_path = public
AS $$
DECLARE v_student_exists BOOLEAN; v_already_taken BOOLEAN; v_new_id BIGINT;
BEGIN
    SELECT EXISTS(SELECT 1 FROM fffece_students WHERE roll_number = p_roll_number AND is_active = true) INTO v_student_exists;
    IF NOT v_student_exists THEN RETURN QUERY SELECT false, 'Invalid student'::TEXT, NULL::BIGINT; RETURN; END IF;
    SELECT EXISTS(SELECT 1 FROM fffece_exam_results WHERE roll_number = p_roll_number) INTO v_already_taken;
    IF v_already_taken THEN RETURN QUERY SELECT false, 'Exam already submitted'::TEXT, NULL::BIGINT; RETURN; END IF;
    BEGIN
        INSERT INTO fffece_exam_results (roll_number, correct_answers, wrong_answers, total_questions, percentage, user_answers, additional_data, violation_type, violation_detected, ip_address, ip_valid)
        VALUES (p_roll_number, p_correct_answers, p_wrong_answers, p_total_questions, p_percentage, p_user_answers, p_additional_data, p_violation_type, p_violation_detected, p_ip_address, p_ip_valid)
        RETURNING id INTO v_new_id;
        RETURN QUERY SELECT true, 'Exam submitted successfully'::TEXT, v_new_id;
    EXCEPTION
        WHEN unique_violation THEN RETURN QUERY SELECT false, 'Exam already submitted'::TEXT, NULL::BIGINT;
        WHEN OTHERS THEN RETURN QUERY SELECT false, 'Submission failed: ' || SQLERRM, NULL::BIGINT;
    END;
END; $$;


-- =========================================================
-- 3. submit_fffaids_exam_result
-- =========================================================
DROP FUNCTION IF EXISTS submit_fffaids_exam_result(TEXT,INTEGER,INTEGER,INTEGER,NUMERIC,JSONB,JSONB,TEXT,BOOLEAN);
DROP FUNCTION IF EXISTS submit_fffaids_exam_result(TEXT,INTEGER,INTEGER,INTEGER,NUMERIC,JSONB,JSONB,TEXT,BOOLEAN,TEXT,BOOLEAN);

CREATE OR REPLACE FUNCTION submit_fffaids_exam_result(
    p_roll_number TEXT, p_correct_answers INTEGER, p_wrong_answers INTEGER,
    p_total_questions INTEGER, p_percentage NUMERIC, p_user_answers JSONB,
    p_additional_data JSONB, p_violation_type TEXT, p_violation_detected BOOLEAN,
    p_ip_address TEXT DEFAULT NULL, p_ip_valid BOOLEAN DEFAULT FALSE
)
RETURNS TABLE(success BOOLEAN, message TEXT, result_id BIGINT)
LANGUAGE plpgsql SECURITY DEFINER SET search_path = public
AS $$
DECLARE v_student_exists BOOLEAN; v_already_taken BOOLEAN; v_new_id BIGINT;
BEGIN
    SELECT EXISTS(SELECT 1 FROM fffaids_students WHERE roll_number = p_roll_number AND is_active = true) INTO v_student_exists;
    IF NOT v_student_exists THEN RETURN QUERY SELECT false, 'Invalid student'::TEXT, NULL::BIGINT; RETURN; END IF;
    SELECT EXISTS(SELECT 1 FROM fffaids_exam_results WHERE roll_number = p_roll_number) INTO v_already_taken;
    IF v_already_taken THEN RETURN QUERY SELECT false, 'Exam already submitted'::TEXT, NULL::BIGINT; RETURN; END IF;
    BEGIN
        INSERT INTO fffaids_exam_results (roll_number, correct_answers, wrong_answers, total_questions, percentage, user_answers, additional_data, violation_type, violation_detected, ip_address, ip_valid)
        VALUES (p_roll_number, p_correct_answers, p_wrong_answers, p_total_questions, p_percentage, p_user_answers, p_additional_data, p_violation_type, p_violation_detected, p_ip_address, p_ip_valid)
        RETURNING id INTO v_new_id;
        RETURN QUERY SELECT true, 'Exam submitted successfully'::TEXT, v_new_id;
    EXCEPTION
        WHEN unique_violation THEN RETURN QUERY SELECT false, 'Exam already submitted'::TEXT, NULL::BIGINT;
        WHEN OTHERS THEN RETURN QUERY SELECT false, 'Submission failed: ' || SQLERRM, NULL::BIGINT;
    END;
END; $$;


-- =========================================================
-- 4. submit_fffit_exam_result
-- =========================================================
DROP FUNCTION IF EXISTS submit_fffit_exam_result(TEXT,INTEGER,INTEGER,INTEGER,NUMERIC,JSONB,JSONB,TEXT,BOOLEAN);
DROP FUNCTION IF EXISTS submit_fffit_exam_result(TEXT,INTEGER,INTEGER,INTEGER,NUMERIC,JSONB,JSONB,TEXT,BOOLEAN,TEXT,BOOLEAN);

CREATE OR REPLACE FUNCTION submit_fffit_exam_result(
    p_roll_number TEXT, p_correct_answers INTEGER, p_wrong_answers INTEGER,
    p_total_questions INTEGER, p_percentage NUMERIC, p_user_answers JSONB,
    p_additional_data JSONB, p_violation_type TEXT, p_violation_detected BOOLEAN,
    p_ip_address TEXT DEFAULT NULL, p_ip_valid BOOLEAN DEFAULT FALSE
)
RETURNS TABLE(success BOOLEAN, message TEXT, result_id BIGINT)
LANGUAGE plpgsql SECURITY DEFINER SET search_path = public
AS $$
DECLARE v_student_exists BOOLEAN; v_already_taken BOOLEAN; v_new_id BIGINT;
BEGIN
    SELECT EXISTS(SELECT 1 FROM fffit_students WHERE roll_number = p_roll_number AND is_active = true) INTO v_student_exists;
    IF NOT v_student_exists THEN RETURN QUERY SELECT false, 'Invalid student'::TEXT, NULL::BIGINT; RETURN; END IF;
    SELECT EXISTS(SELECT 1 FROM fffit_exam_results WHERE roll_number = p_roll_number) INTO v_already_taken;
    IF v_already_taken THEN RETURN QUERY SELECT false, 'Exam already submitted'::TEXT, NULL::BIGINT; RETURN; END IF;
    BEGIN
        INSERT INTO fffit_exam_results (roll_number, correct_answers, wrong_answers, total_questions, percentage, user_answers, additional_data, violation_type, violation_detected, ip_address, ip_valid)
        VALUES (p_roll_number, p_correct_answers, p_wrong_answers, p_total_questions, p_percentage, p_user_answers, p_additional_data, p_violation_type, p_violation_detected, p_ip_address, p_ip_valid)
        RETURNING id INTO v_new_id;
        RETURN QUERY SELECT true, 'Exam submitted successfully'::TEXT, v_new_id;
    EXCEPTION
        WHEN unique_violation THEN RETURN QUERY SELECT false, 'Exam already submitted'::TEXT, NULL::BIGINT;
        WHEN OTHERS THEN RETURN QUERY SELECT false, 'Submission failed: ' || SQLERRM, NULL::BIGINT;
    END;
END; $$;


-- =========================================================
-- 5. submit_fffcivil_exam_result
-- =========================================================
DROP FUNCTION IF EXISTS submit_fffcivil_exam_result(TEXT,INTEGER,INTEGER,INTEGER,NUMERIC,JSONB,JSONB,TEXT,BOOLEAN);
DROP FUNCTION IF EXISTS submit_fffcivil_exam_result(TEXT,INTEGER,INTEGER,INTEGER,NUMERIC,JSONB,JSONB,TEXT,BOOLEAN,TEXT,BOOLEAN);

CREATE OR REPLACE FUNCTION submit_fffcivil_exam_result(
    p_roll_number TEXT, p_correct_answers INTEGER, p_wrong_answers INTEGER,
    p_total_questions INTEGER, p_percentage NUMERIC, p_user_answers JSONB,
    p_additional_data JSONB, p_violation_type TEXT, p_violation_detected BOOLEAN,
    p_ip_address TEXT DEFAULT NULL, p_ip_valid BOOLEAN DEFAULT FALSE
)
RETURNS TABLE(success BOOLEAN, message TEXT, result_id BIGINT)
LANGUAGE plpgsql SECURITY DEFINER SET search_path = public
AS $$
DECLARE v_student_exists BOOLEAN; v_already_taken BOOLEAN; v_new_id BIGINT;
BEGIN
    SELECT EXISTS(SELECT 1 FROM fffcivil_students WHERE roll_number = p_roll_number AND is_active = true) INTO v_student_exists;
    IF NOT v_student_exists THEN RETURN QUERY SELECT false, 'Invalid student'::TEXT, NULL::BIGINT; RETURN; END IF;
    SELECT EXISTS(SELECT 1 FROM fffcivil_exam_results WHERE roll_number = p_roll_number) INTO v_already_taken;
    IF v_already_taken THEN RETURN QUERY SELECT false, 'Exam already submitted'::TEXT, NULL::BIGINT; RETURN; END IF;
    BEGIN
        INSERT INTO fffcivil_exam_results (roll_number, correct_answers, wrong_answers, total_questions, percentage, user_answers, additional_data, violation_type, violation_detected, ip_address, ip_valid)
        VALUES (p_roll_number, p_correct_answers, p_wrong_answers, p_total_questions, p_percentage, p_user_answers, p_additional_data, p_violation_type, p_violation_detected, p_ip_address, p_ip_valid)
        RETURNING id INTO v_new_id;
        RETURN QUERY SELECT true, 'Exam submitted successfully'::TEXT, v_new_id;
    EXCEPTION
        WHEN unique_violation THEN RETURN QUERY SELECT false, 'Exam already submitted'::TEXT, NULL::BIGINT;
        WHEN OTHERS THEN RETURN QUERY SELECT false, 'Submission failed: ' || SQLERRM, NULL::BIGINT;
    END;
END; $$;


-- =========================================================
-- 6. submit_fs4cse_exam_result
-- =========================================================
DROP FUNCTION IF EXISTS submit_fs4cse_exam_result(TEXT,INTEGER,INTEGER,INTEGER,NUMERIC,JSONB,JSONB,TEXT,BOOLEAN);
DROP FUNCTION IF EXISTS submit_fs4cse_exam_result(TEXT,INTEGER,INTEGER,INTEGER,NUMERIC,JSONB,JSONB,TEXT,BOOLEAN,TEXT,BOOLEAN);

CREATE OR REPLACE FUNCTION submit_fs4cse_exam_result(
    p_roll_number TEXT, p_correct_answers INTEGER, p_wrong_answers INTEGER,
    p_total_questions INTEGER, p_percentage NUMERIC, p_user_answers JSONB,
    p_additional_data JSONB, p_violation_type TEXT, p_violation_detected BOOLEAN,
    p_ip_address TEXT DEFAULT NULL, p_ip_valid BOOLEAN DEFAULT FALSE
)
RETURNS TABLE(success BOOLEAN, message TEXT, result_id BIGINT)
LANGUAGE plpgsql SECURITY DEFINER SET search_path = public
AS $$
DECLARE v_student_exists BOOLEAN; v_already_taken BOOLEAN; v_new_id BIGINT;
BEGIN
    SELECT EXISTS(SELECT 1 FROM fs4cse_students WHERE roll_number = p_roll_number AND is_active = true) INTO v_student_exists;
    IF NOT v_student_exists THEN RETURN QUERY SELECT false, 'Invalid student'::TEXT, NULL::BIGINT; RETURN; END IF;
    SELECT EXISTS(SELECT 1 FROM fs4cse_exam_results WHERE roll_number = p_roll_number) INTO v_already_taken;
    IF v_already_taken THEN RETURN QUERY SELECT false, 'Exam already submitted'::TEXT, NULL::BIGINT; RETURN; END IF;
    BEGIN
        INSERT INTO fs4cse_exam_results (roll_number, correct_answers, wrong_answers, total_questions, percentage, user_answers, additional_data, violation_type, violation_detected, ip_address, ip_valid)
        VALUES (p_roll_number, p_correct_answers, p_wrong_answers, p_total_questions, p_percentage, p_user_answers, p_additional_data, p_violation_type, p_violation_detected, p_ip_address, p_ip_valid)
        RETURNING id INTO v_new_id;
        RETURN QUERY SELECT true, 'Exam submitted successfully'::TEXT, v_new_id;
    EXCEPTION
        WHEN unique_violation THEN RETURN QUERY SELECT false, 'Exam already submitted'::TEXT, NULL::BIGINT;
        WHEN OTHERS THEN RETURN QUERY SELECT false, 'Submission failed: ' || SQLERRM, NULL::BIGINT;
    END;
END; $$;


-- =========================================================
-- 7. submit_fs4it_exam_result
-- =========================================================
DROP FUNCTION IF EXISTS submit_fs4it_exam_result(TEXT,INTEGER,INTEGER,INTEGER,NUMERIC,JSONB,JSONB,TEXT,BOOLEAN);
DROP FUNCTION IF EXISTS submit_fs4it_exam_result(TEXT,INTEGER,INTEGER,INTEGER,NUMERIC,JSONB,JSONB,TEXT,BOOLEAN,TEXT,BOOLEAN);

CREATE OR REPLACE FUNCTION submit_fs4it_exam_result(
    p_roll_number TEXT, p_correct_answers INTEGER, p_wrong_answers INTEGER,
    p_total_questions INTEGER, p_percentage NUMERIC, p_user_answers JSONB,
    p_additional_data JSONB, p_violation_type TEXT, p_violation_detected BOOLEAN,
    p_ip_address TEXT DEFAULT NULL, p_ip_valid BOOLEAN DEFAULT FALSE
)
RETURNS TABLE(success BOOLEAN, message TEXT, result_id BIGINT)
LANGUAGE plpgsql SECURITY DEFINER SET search_path = public
AS $$
DECLARE v_student_exists BOOLEAN; v_already_taken BOOLEAN; v_new_id BIGINT;
BEGIN
    SELECT EXISTS(SELECT 1 FROM fs4it_students WHERE roll_number = p_roll_number AND is_active = true) INTO v_student_exists;
    IF NOT v_student_exists THEN RETURN QUERY SELECT false, 'Invalid student'::TEXT, NULL::BIGINT; RETURN; END IF;
    SELECT EXISTS(SELECT 1 FROM fs4it_exam_results WHERE roll_number = p_roll_number) INTO v_already_taken;
    IF v_already_taken THEN RETURN QUERY SELECT false, 'Exam already submitted'::TEXT, NULL::BIGINT; RETURN; END IF;
    BEGIN
        INSERT INTO fs4it_exam_results (roll_number, correct_answers, wrong_answers, total_questions, percentage, user_answers, additional_data, violation_type, violation_detected, ip_address, ip_valid)
        VALUES (p_roll_number, p_correct_answers, p_wrong_answers, p_total_questions, p_percentage, p_user_answers, p_additional_data, p_violation_type, p_violation_detected, p_ip_address, p_ip_valid)
        RETURNING id INTO v_new_id;
        RETURN QUERY SELECT true, 'Exam submitted successfully'::TEXT, v_new_id;
    EXCEPTION
        WHEN unique_violation THEN RETURN QUERY SELECT false, 'Exam already submitted'::TEXT, NULL::BIGINT;
        WHEN OTHERS THEN RETURN QUERY SELECT false, 'Submission failed: ' || SQLERRM, NULL::BIGINT;
    END;
END; $$;


-- =========================================================
-- 8. submit_fece_exam_result
-- =========================================================
DROP FUNCTION IF EXISTS submit_fece_exam_result(TEXT,INTEGER,INTEGER,INTEGER,NUMERIC,JSONB,JSONB,TEXT,BOOLEAN);
DROP FUNCTION IF EXISTS submit_fece_exam_result(TEXT,INTEGER,INTEGER,INTEGER,NUMERIC,JSONB,JSONB,TEXT,BOOLEAN,TEXT,BOOLEAN);

CREATE OR REPLACE FUNCTION submit_fece_exam_result(
    p_roll_number TEXT, p_correct_answers INTEGER, p_wrong_answers INTEGER,
    p_total_questions INTEGER, p_percentage NUMERIC, p_user_answers JSONB,
    p_additional_data JSONB, p_violation_type TEXT, p_violation_detected BOOLEAN,
    p_ip_address TEXT DEFAULT NULL, p_ip_valid BOOLEAN DEFAULT FALSE
)
RETURNS TABLE(success BOOLEAN, message TEXT, result_id BIGINT)
LANGUAGE plpgsql SECURITY DEFINER SET search_path = public
AS $$
DECLARE v_student_exists BOOLEAN; v_already_taken BOOLEAN; v_new_id BIGINT;
BEGIN
    SELECT EXISTS(SELECT 1 FROM fece_students WHERE roll_number = p_roll_number AND is_active = true) INTO v_student_exists;
    IF NOT v_student_exists THEN RETURN QUERY SELECT false, 'Invalid student'::TEXT, NULL::BIGINT; RETURN; END IF;
    SELECT EXISTS(SELECT 1 FROM fece_exam_results WHERE roll_number = p_roll_number) INTO v_already_taken;
    IF v_already_taken THEN RETURN QUERY SELECT false, 'Exam already submitted'::TEXT, NULL::BIGINT; RETURN; END IF;
    BEGIN
        INSERT INTO fece_exam_results (roll_number, correct_answers, wrong_answers, total_questions, percentage, user_answers, additional_data, violation_type, violation_detected, ip_address, ip_valid)
        VALUES (p_roll_number, p_correct_answers, p_wrong_answers, p_total_questions, p_percentage, p_user_answers, p_additional_data, p_violation_type, p_violation_detected, p_ip_address, p_ip_valid)
        RETURNING id INTO v_new_id;
        RETURN QUERY SELECT true, 'Exam submitted successfully'::TEXT, v_new_id;
    EXCEPTION
        WHEN unique_violation THEN RETURN QUERY SELECT false, 'Exam already submitted'::TEXT, NULL::BIGINT;
        WHEN OTHERS THEN RETURN QUERY SELECT false, 'Submission failed: ' || SQLERRM, NULL::BIGINT;
    END;
END; $$;


-- =========================================================
-- 9. submit_ffece_exam_result
-- =========================================================
DROP FUNCTION IF EXISTS submit_ffece_exam_result(TEXT,INTEGER,INTEGER,INTEGER,NUMERIC,JSONB,JSONB,TEXT,BOOLEAN);
DROP FUNCTION IF EXISTS submit_ffece_exam_result(TEXT,INTEGER,INTEGER,INTEGER,NUMERIC,JSONB,JSONB,TEXT,BOOLEAN,TEXT,BOOLEAN);

CREATE OR REPLACE FUNCTION submit_ffece_exam_result(
    p_roll_number TEXT, p_correct_answers INTEGER, p_wrong_answers INTEGER,
    p_total_questions INTEGER, p_percentage NUMERIC, p_user_answers JSONB,
    p_additional_data JSONB, p_violation_type TEXT, p_violation_detected BOOLEAN,
    p_ip_address TEXT DEFAULT NULL, p_ip_valid BOOLEAN DEFAULT FALSE
)
RETURNS TABLE(success BOOLEAN, message TEXT, result_id BIGINT)
LANGUAGE plpgsql SECURITY DEFINER SET search_path = public
AS $$
DECLARE v_student_exists BOOLEAN; v_already_taken BOOLEAN; v_new_id BIGINT;
BEGIN
    SELECT EXISTS(SELECT 1 FROM ffece_students WHERE roll_number = p_roll_number AND is_active = true) INTO v_student_exists;
    IF NOT v_student_exists THEN RETURN QUERY SELECT false, 'Invalid student'::TEXT, NULL::BIGINT; RETURN; END IF;
    SELECT EXISTS(SELECT 1 FROM ffece_exam_results WHERE roll_number = p_roll_number) INTO v_already_taken;
    IF v_already_taken THEN RETURN QUERY SELECT false, 'Exam already submitted'::TEXT, NULL::BIGINT; RETURN; END IF;
    BEGIN
        INSERT INTO ffece_exam_results (roll_number, correct_answers, wrong_answers, total_questions, percentage, user_answers, additional_data, violation_type, violation_detected, ip_address, ip_valid)
        VALUES (p_roll_number, p_correct_answers, p_wrong_answers, p_total_questions, p_percentage, p_user_answers, p_additional_data, p_violation_type, p_violation_detected, p_ip_address, p_ip_valid)
        RETURNING id INTO v_new_id;
        RETURN QUERY SELECT true, 'Exam submitted successfully'::TEXT, v_new_id;
    EXCEPTION
        WHEN unique_violation THEN RETURN QUERY SELECT false, 'Exam already submitted'::TEXT, NULL::BIGINT;
        WHEN OTHERS THEN RETURN QUERY SELECT false, 'Submission failed: ' || SQLERRM, NULL::BIGINT;
    END;
END; $$;
