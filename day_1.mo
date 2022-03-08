import Array "mo:base/Array";


actor {

    // Challenge 1
    public func add(n : Nat, m : Nat) : async Nat {
        return(n + m);
    };

    // Challenge 2
    public func square(n : Nat) : async Nat {
        return(n * n);
    };

    // Challenge 3
    public func days_to_second(n : Nat) : async Nat {
        return(n * 24 * 60 * 60);
    };

    // Challenge 4
    var counter: Nat = 0;
    
    public func increment_counter(): async Nat{
        counter+=1 ;
        return counter;
    };

    public func clear_counter(): async () {
        counter := 0;
    };

    // Challenge 5
    public func divide(n : Nat,m : Nat) : async Bool {
        return (m%n==0);
    };

    // Challenge 6
    public func is_even(n : Nat) : async Bool {
        return(n%2==0);
    };


    // Challenge 7
    var sum:Nat =0;
    public func sum_of_array(array : [Nat]) : async Nat {
        for (value in array.vals()){
            sum+=value;
        };

        return (sum);
    };

    // Challenge 8
    
    public func maximum(array : [Nat]) : async Nat {
        if(array.size()==0)
        {
            return (0);
        };
        
        var max: Nat = array[0];
        for (value in array.vals()){
            if(value > max)
            {
                max:= value;
            };
        };

        return (max);
    };

    // Challenge 9
    
    public func remove_from_array(array : [Nat],n : Nat) : async [Nat] {
        
        var new_array: [Nat]=[];
        for (value in array.vals()){
            if(value != n)
            {
                new_array := Array.append<Nat>(new_array,[value])
            };
        };

        return (new_array);
    };


    // Challenge 10 : Selection sort

    private func _swap(array : [Nat], i : Nat, j : Nat) : [Nat] {
        // Transform our immutable array into a mutable one so we can modify values.
        let array_mutable = Array.thaw<Nat>(array);
        let tmp = array[i];
        array[i] := array[j];
        array[j] := tmp;
        // Transform our mutable array into an immutable array.
        return(Array.freeze<Nat>(array));
    };

    public func selection_sort(array : [Nat]) : async [Nat] {
        var sorted = array;
        let size = array.size();
        // First loop
        for(i in Iter.range(0, size - 1)){
        var index_minimum = i;
        // Second loop to determine the minimum in the sub array
        for(j in Iter.range(i, size - 1)){
            if(sorted[j] < sorted[index_minimum]){
            index_minimum := j;
            };
        };
        sorted := _swap(sorted, index_minimum, i);
        };  
        return(sorted);
    };

    // Note : This _swap function that swap index i and j of a mutable array is not something I would recommend. If you are defining an array as immutable you shouldn't touch the values inside after the declaration.
    // Also Motoko has a sort function in the Array library. Challenge 10 was mostly for educational purposes around sorting algorithm.

};


    





    
    

}