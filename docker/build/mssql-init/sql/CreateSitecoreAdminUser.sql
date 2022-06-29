USE [Sitecore.Core]

declare @UserName_ nvarchar(256) = $(UserName)
declare @EMail_ nvarchar(256) = $(EMail)
declare @EncodedPassword_ nvarchar(128) = $(EncodedPassword)
declare @EncodedSalt_ nvarchar(128) = $(EncodedSalt)

DECLARE @now datetime = GETDATE()
exec aspnet_Membership_CreateUser 'sitecore', @UserName_, @EncodedPassword_, @EncodedSalt_, @EMail_,'','', 1, @now, @now, 0, 0,null

DECLARE @UserId nvarchar(256)
SELECT TOP 1
  @UserId = [UserId]
FROM [aspnet_Users]
WHERE [UserName] = @UserName_

INSERT [dbo].[aspnet_Profile]
  ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate])
VALUES
  (@UserId,
    N'IsAdministrator:S:0:4:Portrait:S:4:29:FullName:S:33:13:ProfileItemId:S:46:38:SerializedData:B:0:1587:',
    N'Trueoffice/16x16/default_user.pngAdministrator{AE4C4969-5B7E-4B4E-9042-B2D8701CE214}',
    0x0001000000FFFFFFFF01000000000000000401000000E20153797374656D2E436F6C6C656374696F6E732E47656E657269632E44696374696F6E61727960325B5B53797374656D2E537472696E672C206D73636F726C69622C2056657273696F6E3D342E302E302E302C2043756C747572653D6E65757472616C2C205075626C69634B6579546F6B656E3D623737613563353631393334653038395D2C5B53797374656D2E537472696E672C206D73636F726C69622C2056657273696F6E3D342E302E302E302C2043756C747572653D6E65757472616C2C205075626C69634B6579546F6B656E3D623737613563353631393334653038395D5D040000000756657273696F6E08436F6D7061726572084861736853697A650D4B657956616C756550616972730003000308920153797374656D2E436F6C6C656374696F6E732E47656E657269632E47656E65726963457175616C697479436F6D706172657260315B5B53797374656D2E537472696E672C206D73636F726C69622C2056657273696F6E3D342E302E302E302C2043756C747572653D6E65757472616C2C205075626C69634B6579546F6B656E3D623737613563353631393334653038395D5D08E60153797374656D2E436F6C6C656374696F6E732E47656E657269632E4B657956616C75655061697260325B5B53797374656D2E537472696E672C206D73636F726C69622C2056657273696F6E3D342E302E302E302C2043756C747572653D6E65757472616C2C205075626C69634B6579546F6B656E3D623737613563353631393334653038395D2C5B53797374656D2E537472696E672C206D73636F726C69622C2056657273696F6E3D342E302E302E302C2043756C747572653D6E65757472616C2C205075626C69634B6579546F6B656E3D623737613563353631393334653038395D5D5B5D0400000009020000000700000009030000000402000000920153797374656D2E436F6C6C656374696F6E732E47656E657269632E47656E65726963457175616C697479436F6D706172657260315B5B53797374656D2E537472696E672C206D73636F726C69622C2056657273696F6E3D342E302E302E302C2043756C747572653D6E65757472616C2C205075626C69634B6579546F6B656E3D623737613563353631393334653038395D5D00000000070300000000010000000400000003E40153797374656D2E436F6C6C656374696F6E732E47656E657269632E4B657956616C75655061697260325B5B53797374656D2E537472696E672C206D73636F726C69622C2056657273696F6E3D342E302E302E302C2043756C747572653D6E65757472616C2C205075626C69634B6579546F6B656E3D623737613563353631393334653038395D2C5B53797374656D2E537472696E672C206D73636F726C69622C2056657273696F6E3D342E302E302E302C2043756C747572653D6E65757472616C2C205075626C69634B6579546F6B656E3D623737613563353631393334653038395D5D04FCFFFFFFE40153797374656D2E436F6C6C656374696F6E732E47656E657269632E4B657956616C75655061697260325B5B53797374656D2E537472696E672C206D73636F726C69622C2056657273696F6E3D342E302E302E302C2043756C747572653D6E65757472616C2C205075626C69634B6579546F6B656E3D623737613563353631393334653038395D2C5B53797374656D2E537472696E672C206D73636F726C69622C2056657273696F6E3D342E302E302E302C2043756C747572653D6E65757472616C2C205075626C69634B6579546F6B656E3D623737613563353631393334653038395D5D02000000036B65790576616C756501010605000000272F73697465636F72655C5C61646D696E2F5368656C6C2F53686F7744617461626173654E616D650606000000047472756501F9FFFFFFFCFFFFFF06080000001357616C6C70617065724261636B67726F756E640609000000072330373333374301F6FFFFFFFCFFFFFF060B0000001157616C6C7061706572506F736974696F6E060C00000005436F76657201F3FFFFFFFCFFFFFF060E0000001F2F73697465636F72655C61646D696E2F526962626F6E2F4D79205374726970060F000000267B44333341303634312D394631432D343938342D383334322D3036353543334430463132337D0B, CAST(0x0000A2F500D2B376 AS DateTime))

UPDATE [dbo].[aspnet_Membership]
SET [PasswordFormat] = 1
WHERE [UserId] = @UserID