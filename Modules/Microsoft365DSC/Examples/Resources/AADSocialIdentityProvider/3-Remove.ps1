<#
This example is used to test new resources and showcase the usage of new resources being worked on.
It is not meant to use as a production baseline.
#>

Configuration Example
{
    param
    (
        [Parameter(Mandatory = $true)]
        [PSCredential]
        $credsCredential
    )

    Import-DscResource -ModuleName Microsoft365DSC

    node localhost
    {
        AADSocialIdentityProvider "AADSocialIdentityProvider-Google"
        {
            ClientId             = "Google-OAUTH";
            ClientSecret         = "FakeSecret-Updated"; # Updated Property
            Credential           = $credsCredential;
            DisplayName          = "My Google Provider";
            Ensure               = "Absent";
            IdentityProviderType = "Google";
        }
    }
}
