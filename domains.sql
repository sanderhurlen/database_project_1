CREATE DOMAIN positive_int AS INT
CHECK (
    value >= 0
    );

CREATE DOMAIN positive_bigint AS BIGINT
CHECK (
    value >= 0
    );

CREATE DOMAIN positive_double AS DOUBLE PRECISION
CHECK (
    value >= 0
    );
