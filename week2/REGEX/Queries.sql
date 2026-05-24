-- Q1: From the column mixed_value, extract the numeric characters that appear at the very beginning of the value. The extraction must stop as soon as a non-numeric character appears.
SELECT mixed_value,
       REGEXP_SUBSTR(mixed_value, '^[0-9]+') AS result
FROM regex_practice;

-- Q2: From the column mixed_value, extract the numeric characters that appear at the very end of the value. No alphabetic or special characters should be included.
SELECT mixed_value,
       REGEXP_SUBSTR(mixed_value, '[0-9]+$') AS result
FROM regex_practice;

-- Q3: From the column mixed_value, extract only the first single character of the value, regardless of whether it is a letter or a number.
SELECT mixed_value,
       REGEXP_SUBSTR(mixed_value, '^.') AS result
FROM regex_practice;

-- Q4: From the column mixed_value, extract only the last single character of the value.
SELECT mixed_value,
       REGEXP_SUBSTR(mixed_value, '.$') AS result
FROM regex_practice;

-- Q5: From the column mixed_value, extract exactly two consecutive numeric characters that appear anywhere in the value. Do not extract more or fewer than two digits.
SELECT mixed_value,
       REGEXP_SUBSTR(mixed_value, '[0-9]{2}') AS result
FROM regex_practice;

-- Q6: From the column mixed_value, extract exactly one numeric character that appears anywhere in the value.
SELECT mixed_value,
       REGEXP_SUBSTR(mixed_value, '[0-9]') AS result
FROM regex_practice;

-- Q7: From the column phone, extract the country code present at the beginning of the phone number. The extracted value must contain only the country code digits.
SELECT phone,
       REGEXP_SUBSTR(phone, '[0-9]+') AS result
FROM regex_practice;

-- Q8: From the column mixed_value, extract the numeric portion that is present between alphabetic characters.
SELECT mixed_value,
       REGEXP_SUBSTR(mixed_value, '[0-9]+') AS result
FROM regex_practice;

-- Q9: From the column email, extract the text that appears before the at-symbol. The extracted value must not include the at-symbol itself.
SELECT email,
       REGEXP_SUBSTR(email, '^[^@]+') AS result
FROM regex_practice;

-- Q10: From the column email, extract the text that appears after the at-symbol including the domain name.
SELECT email,
       REGEXP_SUBSTR(email, '(?<=@).*') AS result
FROM regex_practice;

-- Q11: From the column email, extract only the domain name without including the at-symbol.
SELECT email,
       REGEXP_SUBSTR(email, '[^@]+$') AS result
FROM regex_practice;

-- Q12: From the column email, extract only the text that appears after the last dot in the email address.
SELECT email,
       REGEXP_SUBSTR(email, '[^.]+$') AS result
FROM regex_practice;

-- Q13: From the column mixed_value, extract only alphabetic characters that appear together as a continuous sequence.
SELECT mixed_value,
       REGEXP_SUBSTR(mixed_value, '[A-Za-z]+') AS result
FROM regex_practice;

-- Q14: From the column mixed_value, extract only numeric characters that appear together as a continuous sequence.
SELECT mixed_value,
       REGEXP_SUBSTR(mixed_value, '[0-9]+') AS result
FROM regex_practice;

-- Q15: From the column full_text, extract exactly the first three characters of the value.
SELECT full_text,
       REGEXP_SUBSTR(full_text, '^.{3}') AS result
FROM regex_practice;

-- Q16: From the column full_text, extract exactly the last two characters of the value.
SELECT full_text,
       REGEXP_SUBSTR(full_text, '..$') AS result
FROM regex_practice;

-- Q17: From the column full_text, extract the employee number portion that appears between the alphabetic prefix and the first underscore.
SELECT full_text,
       REGEXP_SUBSTR(full_text, '[0-9]+') AS result
FROM regex_practice;

-- Q18: From the column full_text, extract the country code that appears at the end of the value.
SELECT full_text,
       REGEXP_SUBSTR(full_text, '[A-Z0-9]+$') AS result
FROM regex_practice;

-- Q19: From the column full_text, extract the alphabetic text that appears between two underscore characters.
SELECT full_text,
       REGEXP_SUBSTR(full_text, '(?<=_)[A-Za-z]+(?=_)') AS result
FROM regex_practice;

-- Q20: From the column phone, extract the numeric characters that appear immediately after the plus sign. The extraction must include only the digits that represent the country code.
SELECT phone,
       REGEXP_SUBSTR(phone, '(?<=\\+)[0-9]+') AS result
FROM regex_practice;