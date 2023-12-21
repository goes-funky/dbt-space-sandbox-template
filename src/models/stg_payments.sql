with source as (

    select * from {{ ref('raw_payments') }}

),

renamed as (

    select
        id as payment_id,
        order_id as order_id,
        payment_method as payment_method,

        -- `amount` is currently stored in cents, so we convert it to dollars
        CAST(REPLACE(amount, ",", "") as DECIMAl) / 100 as amount

    from source

)

select * from renamed
