# Prevent inheritance

[StackOverflow](https://stackoverflow.com/questions/782252/avoid-web-config-inheritance-in-child-web-application-using-inheritinchildapplic)

you need to wrap the individual `web.config` sections for which you want to disable inheritance. For example:

```xml
<!-- disable inheritance for the connectionStrings section -->
<location path="." inheritInChildApplications="false">
   <connectionStrings>
   </connectionStrings>
</location>

<!-- leave inheritance enabled for appSettings -->
<appSettings>
</appSettings>

<!-- disable inheritance for the system.web section -->
<location path="." inheritInChildApplications="false">
   <system.web>
        <webParts>
        </webParts>
        <membership>
        </membership>

        <compilation>
        </compilation>
      </system.web>
 </location>
```

While `<clear />` may work for some configuration sections, there are some that instead require a `<remove name="...">` directive, and still others don't seem to support either. In these situations, it's probably appropriate to set `inheritInChildApplications="false"`.
