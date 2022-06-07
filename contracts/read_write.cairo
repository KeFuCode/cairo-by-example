%lang starknet
%builtins pedersen range_check

from starkware.cairo.common.cairo_builtins import HashBuiltin

@storage_var
func stored_felt() -> (res : felt):
end

# Function to get the stored number.
@view
func get{
        syscall_ptr : felt*,
        pedersen_ptr : HashBuiltin*,
        range_check_ptr
    }() -> (
        res : felt
    ):
    let (res) = stored_felt.read()
    return (res)
end

# Function to update the stored number (field element).
@external
func save{
        syscall_ptr : felt*,
        pedersen_ptr : HashBuiltin*,
        range_check_ptr
    }(
        input : felt
    ):
    stored_felt.write(input)
    return ()
end