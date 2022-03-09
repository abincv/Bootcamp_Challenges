import Nat8 "mo:base/Nat8";
import Array "mo:base/Array";
import Iter "mo:base/Iter";
import Nat "mo:base/Nat";
import Char "mo:base/Char";
import Text "mo:base/Text";

actor {

    // Challenge 1
    public func nat_to_nat8(n : Nat) : async Nat8 {
        if(n > 255)
        {
            return Nat8.fromNat(n%256);  //wrap around to avoid trap
        }
        
        else
        {
            return (Nat8.fromNat(n));
        };   
    };


    // Challenge 2
    public func max_number_with_n_bits(n : Nat) : async Nat {
        return (2**n)-1; 
    };

    // Challenge 3
    public func decimal_to_bits(n : Nat) : async Text {
        var binary : Text = "";
        var i = 0;
        var _n = n;
        while ( _n > 0 )       
        {    
            binary := Nat.toText(_n % 2) # binary ;    
            _n := _n / 2;    
        };

        return binary;  
        
    };


    // Challenge 4
    public func capitalize_character(ch : Text) : async Text {
        for(c in ch.chars())
        {
            if(Char.isLowercase(c))
            {
                var uni : Nat32 = (Char.toNat32(c)) - 32;
                return Char.toText(Char.fromNat32(uni));
            };

        };

        return ch;
        
    };

    // Challenge 5
    public func capitalize_text(t : Text) : async Text {
        var cap_text = "";
        //var ch = "";
        for(c in t.chars())
        {
            //ch:= await capitalize_character(c);
            cap_text := cap_text # (await capitalize_character(Char.toText(c)));
        };
        return cap_text;
        
    };


    // Challenge 6
    public func is_inside(t : Text , c : Text) : async Bool {
        //let p : Text.Pattern = #char c;
        return Text.contains ( t , #text c );
        
    };

    // Challenge 7
    public func trim_whitespace(t : Text ) : async Text {
        var p : Text = " ";
        return Text.trim( t , #text p );
        
    };

    // Challenge 8
    public func duplicated_character(t : Text ) : async Text {
        for(c in t.chars())
        {
            if((Text.replace(t, #char c , "").size()) < (t.size()-1 ))
            {
                return Char.toText(c);
            };
        };

        return t;
        
    };


    // Challenge 9
    public func size_in_bytes(t : Text ) : async Nat {
        return (Text.encodeUtf8(t)).size();

        
    };

    // Challenge 10 
    func swap(array : [Nat], i : Nat, j : Nat) : [Nat] {
        let mutable_array = Array.thaw<Nat>(array);
        let tmp = mutable_array[i];
        mutable_array[i] := mutable_array[j];
        mutable_array[j] := tmp;
        return(Array.freeze<Nat>(mutable_array))
    };

    public func bubble_sort(array : [Nat]) : async [Nat] {
        var sorted = array;
        let size = array.size();
        for(i in Iter.range(0, size - 1)){
            for (j in Iter.range(0, size - 1 - i)){
                if(sorted[i] > sorted[i + 1]){
                    sorted := swap(sorted, i , j);
                };
            };
        };
        return (sorted)
    };

}


    




   