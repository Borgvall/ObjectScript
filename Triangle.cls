Class User.Triangle Extends %Persistent
{
    property A As %Double;
    property B As %Double;

    Method %OnNew(a As %Double, b As %Double) As %Status
    {
        Set ..A = a, ..B = b
        Return $$$OK
    }

    Method Area() As %Double {
        Return (..A * ..B) / 2
    }

    Method Hypotenuse() As %Double {
        Return $ZSQRT((..A * ..A) + (..B * ..B))
    }
Storage Default
{
<Data name="TriangleDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>A</Value>
</Value>
<Value name="3">
<Value>B</Value>
</Value>
</Data>
<DataLocation>^User.TriangleD</DataLocation>
<DefaultData>TriangleDefaultData</DefaultData>
<IdLocation>^User.TriangleD</IdLocation>
<IndexLocation>^User.TriangleI</IndexLocation>
<StreamLocation>^User.TriangleS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}