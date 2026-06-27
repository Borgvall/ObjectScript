Class User.Fan Extends %Persistent
{
    property Triangle1 As User.Triangle;
    property Triangle2 As User.Triangle;
    property Triangle3 As User.Triangle;
    property Triangle4 As User.Triangle;

    Method %OnNew() As %Status
    {
        Set ..Triangle1 = ##class(User.Triangle).%New()
        Set ..Triangle2 = ##class(User.Triangle).%New()
        Set ..Triangle3 = ##class(User.Triangle).%New()
        Set ..Triangle4 = ##class(User.Triangle).%New()
        Return $$$OK
    }

    Method TotalArea() As %Double {
        Return ..Triangle1.Area() + ..Triangle2.Area() + ..Triangle3.Area() + ..Triangle4.Area()
    }

Storage Default
{
<Data name="FanDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Triangle1</Value>
</Value>
<Value name="3">
<Value>Triangle2</Value>
</Value>
<Value name="4">
<Value>Triangle3</Value>
</Value>
<Value name="5">
<Value>Triangle4</Value>
</Value>
</Data>
<DataLocation>^User.FanD</DataLocation>
<DefaultData>FanDefaultData</DefaultData>
<IdLocation>^User.FanD</IdLocation>
<IndexLocation>^User.FanI</IndexLocation>
<StreamLocation>^User.FanS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
