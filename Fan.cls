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

    Method %Save(force As %Boolean = 0) As %Status
    {
        // Speichere zuerst alle vier Dreiecke
        If ..Triangle1 '= "" {
            Set sc = ..Triangle1.%Save(force)
            If 'sc Return sc
        }
        
        If ..Triangle2 '= "" {
            Set sc = ..Triangle2.%Save(force)
            If 'sc Return sc
        }
        
        If ..Triangle3 '= "" {
            Set sc = ..Triangle3.%Save(force)
            If 'sc Return sc
        }
        
        If ..Triangle4 '= "" {
            Set sc = ..Triangle4.%Save(force)
            If 'sc Return sc
        }
        
        // Dann speichere das Fan-Objekt selbst
        Return ##super(force)
    }

    Method %AtomicSave(force As %Boolean = 0) As %Status
    {
        // Atomare Speicherung mit ACID-Garantien
        TSTART
        Try {
            Set sc = ..%Save(force)
            If 'sc {
                TROLLBACK
                Return sc
            }
            TCOMMIT
            Return sc
        }
        Catch ex {
            TROLLBACK
            Return ex.AsStatus()
        }
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
