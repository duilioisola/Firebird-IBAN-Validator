/*============================================================================
Script File

Created   : 24 - agust - 2018

This procedure validates an IBAN account number and returns a cleaned
account number.

It is a pure Firebird PLSQL procedure without dependencies.

============================================================================*/

set term ^;

create or alter procedure validate_iban (
    iban_account_number varchar(100))
returns (
    valid smallint,
    iban varchar(34))
AS
declare variable i integer;
declare variable l integer;
declare variable alpha varchar(34);
declare variable number integer;
begin
    /*
       Returns the cleaned IBAN account number (Just letters and numbers).
       Returns VALID=1 if it is a valid IBAN account number
    */

    -- Initialization
    valid = 0;
    iban = '';

    -- Account cleaning (just ['A'..'Z', '0'..'9'])
    iban_account_number = upper(iban_account_number);
    i = 1;
    while (i <= char_length(iban_account_number)) do
    begin
        if ((substring(iban_account_number from i for 1) in ('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',
                                                              'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T',
                                                              'U', 'V', 'W', 'X', 'Y', 'Z', '0', '1', '2', '3',
                                                              '4', '5', '6', '7', '8', '9'))) then
            iban = iban || substring(iban_account_number from i for 1);

        i = i + 1;
    end

    -- Fisrt the obvious case of empty account
    if (iban <> '') then
    begin
        -- Fist 4 digits go to the back of the account (Country + Control Digits)
        iban = substring(iban from 5 for char_length(iban) - 4) || substring(iban from 1 for 4);

        -- Translate letters to numbers (A -> 10, B -> 11, C -> 12, ...)
        i = 1;
        while (i <= char_length(iban)) do
        begin
            if (substring(iban from i for 1) = 'A') then
                iban = substring(iban from 1 for i - 1) || '10' || substring(iban from i + 1 for char_length(iban) - i);
            if (substring(iban from i for 1) = 'B') then
                iban = substring(iban from 1 for i - 1) || '11' || substring(iban from i + 1 for char_length(iban) - i);
            if (substring(iban from i for 1) = 'C') then
                iban = substring(iban from 1 for i - 1) || '12' || substring(iban from i + 1 for char_length(iban) - i);
            if (substring(iban from i for 1) = 'D') then
                iban = substring(iban from 1 for i - 1) || '13' || substring(iban from i + 1 for char_length(iban) - i);
            if (substring(iban from i for 1) = 'E') then
                iban = substring(iban from 1 for i - 1) || '14' || substring(iban from i + 1 for char_length(iban) - i);
            if (substring(iban from i for 1) = 'F') then
                iban = substring(iban from 1 for i - 1) || '15' || substring(iban from i + 1 for char_length(iban) - i);
            if (substring(iban from i for 1) = 'G') then
                iban = substring(iban from 1 for i - 1) || '16' || substring(iban from i + 1 for char_length(iban) - i);
            if (substring(iban from i for 1) = 'H') then
                iban = substring(iban from 1 for i - 1) || '17' || substring(iban from i + 1 for char_length(iban) - i);
            if (substring(iban from i for 1) = 'I') then
                iban = substring(iban from 1 for i - 1) || '18' || substring(iban from i + 1 for char_length(iban) - i);
            if (substring(iban from i for 1) = 'J') then
                iban = substring(iban from 1 for i - 1) || '19' || substring(iban from i + 1 for char_length(iban) - i);
            if (substring(iban from i for 1) = 'K') then
                iban = substring(iban from 1 for i - 1) || '20' || substring(iban from i + 1 for char_length(iban) - i);
            if (substring(iban from i for 1) = 'L') then
                iban = substring(iban from 1 for i - 1) || '21' || substring(iban from i + 1 for char_length(iban) - i);
            if (substring(iban from i for 1) = 'M') then
                iban = substring(iban from 1 for i - 1) || '22' || substring(iban from i + 1 for char_length(iban) - i);
            if (substring(iban from i for 1) = 'N') then
                iban = substring(iban from 1 for i - 1) || '23' || substring(iban from i + 1 for char_length(iban) - i);
            if (substring(iban from i for 1) = 'O') then
                iban = substring(iban from 1 for i - 1) || '24' || substring(iban from i + 1 for char_length(iban) - i);
            if (substring(iban from i for 1) = 'P') then
                iban = substring(iban from 1 for i - 1) || '25' || substring(iban from i + 1 for char_length(iban) - i);
            if (substring(iban from i for 1) = 'Q') then
                iban = substring(iban from 1 for i - 1) || '26' || substring(iban from i + 1 for char_length(iban) - i);
            if (substring(iban from i for 1) = 'R') then
                iban = substring(iban from 1 for i - 1) || '27' || substring(iban from i + 1 for char_length(iban) - i);
            if (substring(iban from i for 1) = 'S') then
                iban = substring(iban from 1 for i - 1) || '28' || substring(iban from i + 1 for char_length(iban) - i);
            if (substring(iban from i for 1) = 'T') then
                iban = substring(iban from 1 for i - 1) || '29' || substring(iban from i + 1 for char_length(iban) - i);
            if (substring(iban from i for 1) = 'U') then
                iban = substring(iban from 1 for i - 1) || '30' || substring(iban from i + 1 for char_length(iban) - i);
            if (substring(iban from i for 1) = 'V') then
                iban = substring(iban from 1 for i - 1) || '31' || substring(iban from i + 1 for char_length(iban) - i);
            if (substring(iban from i for 1) = 'W') then
                iban = substring(iban from 1 for i - 1) || '32' || substring(iban from i + 1 for char_length(iban) - i);
            if (substring(iban from i for 1) = 'X') then
                iban = substring(iban from 1 for i - 1) || '33' || substring(iban from i + 1 for char_length(iban) - i);
            if (substring(iban from i for 1) = 'Y') then
                iban = substring(iban from 1 for i - 1) || '34' || substring(iban from i + 1 for char_length(iban) - i);
            if (substring(iban from i for 1) = 'Z') then
                iban = substring(iban from 1 for i - 1) || '35' || substring(iban from i + 1 for char_length(iban) - i);

            i = i + 1;
        end

        -- Calculate modulus 97 of the account
        i = 1;
        l = 9;
        valid = 0;
        alpha = '';

        -- Divide in chunks of 9 digits and calculate MOD_97
        while (i <= char_length(iban)) do
        begin
            if (l > char_length(iban)) then
                l = char_length(iban);
            alpha = alpha || substring(iban from i for l);
            number = cast(alpha as integer);

            valid = mod(number, 97);

            i = i + l;
            alpha = cast(valid as varchar(34));
            l = 9 - char_length(alpha);
        end

        -- It is a valid IBAN account number if MOD_97 = 1
        if (valid <> 1) then
            valid = 0;
    end

    suspend;
end
^
commit work^