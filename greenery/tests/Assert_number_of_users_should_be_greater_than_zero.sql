select
    NumUser
from {{ ref('user_count') }}
where NumUser <= 0