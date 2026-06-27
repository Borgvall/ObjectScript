Class User.Triangle Extends %Persistent
{
    property A As %Float;
    property B As %Float;

    Method %OnNew(a As %Float, b As %Float) As %Status
    {
        Set ..A = a, ..B = b
        Return $$$OK
    }

    Method Area() As %Float {
        Return (..A * ..B) / 2
    }

    Method Hypotenuse() As %Float {
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