resource "prismacloud_policy" "ebea0d86-7fbd-42e3-8a46-27e7568c2525" {
  name            = "Bot Protection should be enabled for Azure Application Gateway WAF"
  policy_type     = "config"
  cloud_type      = "azure"
  policy_subtypes = ["run"]
  severity        = "low"
  labels          = ["azure-test"]
  description     = "This policy ensures that bot protection is enabled in all Azure Application Gateway Web Application Firewall (WAF) policies"
  enabled         = true
  rule {
    name      = "Bot Protection should be enabled for Azure Application Gateway WAF"
    rule_type = "Config"
    parameters = {
      savedSearch = true
    }
    criteria = prismacloud_saved_search.ebea0d86-7fbd-42e3-8a46-27e7568c2525.id
  }

}

resource "prismacloud_saved_search" "ebea0d86-7fbd-42e3-8a46-27e7568c2525" {
  name        = "Bot Protection should be enabled for Azure Application Gateway WAF"
  description = "This policy ensures that bot protection is enabled in all Azure Application Gateway Web Application Firewall (WAF) policies"
  search_id   = prismacloud_rql_search.ebea0d86-7fbd-42e3-8a46-27e7568c2525.search_id
  query       = prismacloud_rql_search.ebea0d86-7fbd-42e3-8a46-27e7568c2525.query
  time_range {
    relative {
      unit   = prismacloud_rql_search.ebea0d86-7fbd-42e3-8a46-27e7568c2525.time_range.0.relative.0.unit
      amount = prismacloud_rql_search.ebea0d86-7fbd-42e3-8a46-27e7568c2525.time_range.0.relative.0.amount
    }
  }
}


resource "prismacloud_rql_search" "ebea0d86-7fbd-42e3-8a46-27e7568c2525" {
  search_type = "config"
  skip_result = true
  query       = "config from cloud.resource where api.name = 'azure-application-gateway-waf-policy' AND json.rule = properties.managedRules.managedRuleSets[*].ruleSetType does not equal \"Microsoft_BotManagerRuleSet\""
  time_range {
    relative {
      unit   = "hour"
      amount = 24
    }
  }
}
