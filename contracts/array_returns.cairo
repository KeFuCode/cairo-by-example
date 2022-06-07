%lang starknet
%builtins range_check

from starkware.cairo.common.math import assert_in_range

struct ArrayCalculation:
    member a : felt
    member b : felt
    member c : felt
    member d : felt
end

@view
func duplicate_array{
        range_check_ptr
    }(
        input_arr_len : felt,
        input_arr : felt*
    ) -> (
        out_arr_1_len : felt,
        out_arr_1 : felt*,
        array_calculation : ArrayCalculation,
        out_arr_2_len : felt,
        out_arr_2 : felt*
    ):
    # Returns the two arrays with a struct between them.
    # Require the input array length to be [5, 11)
    assert_in_range(input_arr_len, 5, 11)
    # Do the calcuations.
    let one = input_arr[0] + input_arr[1]
    let two = one + input_arr[2]
    let three = two + input_arr[3]
    let four = three + input_arr[4]
    # Define the struct.
    let array_calculation = ArrayCalculation(
        a=one, b=two, c=three, d=four)
    # Return the array-struct-array sequence.
    return (
        input_arr_len,
        input_arr,
        array_calculation,
        input_arr_len,
        input_arr)
end