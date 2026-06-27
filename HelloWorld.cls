Class User.HelloWorld Extends %RegisteredObject
{
    ClassMethod Main() As %Status
    {
        Write "Hallo Welt!", !
        Return $$$OK
    }
}