---
title: Tenant Authentication Service API Reference

language_tabs:
  - shell

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='http://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---

# Introduction

Welcome TAS API

# Plans

## get plans

> Get Plans

```shell
curl http://example.com/v1/plans
```

> Make sure to replace `example.com` with API endpoint.

> The above command returns JSON structured like this:

```json
{
  "plans":[
    {
      "plan_name":"award ","plan_display_name":"","plan_description":"动点科技奖励","available":true,"customized":true,"created_at":"0001-01-01T00:00:00Z","updated_at":"2015-03-24T09:01:24Z","is_org":false
    },
    {
      "plan_name":"basic_expensive","plan_display_name":"","plan_description":"贵的都是好东西","available":true,"customized":false,"created_at":"2015-04-30T08:32:28Z","updated_at":"2015-05-06T11:20:09Z","is_org":false
    },
  ]
}
```

This endpoint retrieves plans.

### HTTP Request

`GET http://example.com/v1/plans`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
available | true | If set to true, the result will only include available plans.
customized | None | If set to true/false, the result will only include customized/uncustomized plans.

## get organization plans

> Get organization Plans

```shell
curl http://example.com/v1/organization-plans
```

> Make sure to replace `example.com` with API endpoint.

> The above command returns JSON structured like this:

```json
{
  "plans":[
    {
      "plan_name":"basic-org","plan_display_name":"","plan_description":"基本套餐","available":true,"customized":false,"created_at":"0001-01-01T00:00:00Z","updated_at":"2015-07-14T09:23:48Z","is_org":true
    },
    {
      "plan_name":"freeorg","plan_display_name":"基础套餐","plan_description":"团队协作，持续集成和应用交付","available":true,"customized":false,"created_at":"2015-07-29T10:16:49Z","updated_at":"2015-07-29T10:16:49Z","is_org":true
    },
    {
      "plan_name":"office-org","plan_display_name":"","plan_description":"daocloud co 测试","available":true,"customized":false,"created_at":"0001-01-01T00:00:00Z","updated_at":"2015-07-15T09:58:04Z","is_org":true
    }
  ]
}
```

This endpoint retrieves organization plans.

### HTTP Request

`GET http://example.com/v1/organization-plans`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
available | true | If set to true, the result will only include available plans.
customized | None | If set to true/false, the result will only include customized/uncustomized plans.

## Get a Specific plan

```shell
curl "/v1/plans/dev8x"
```

> The above command returns JSON structured like this:

```json
{
  "plan_name":"dev8x","plan_display_name":"8x 集群","plan_description":"专业套餐，最多 8 个容器，高性能集群","available":true,"customized":false,"created_at":"2015-07-29T10:16:48Z","updated_at":"2015-10-20T10:33:40Z","is_org":false
}
```

This endpoint retrieves a specific plan.

### HTTP Request

`GET /v1/plans/<Name>`

### URL Parameters

Parameter | Description
--------- | -----------
Name | The Name of the plan to retrieve


## Create a plan

```shell
curl -X POST -H "Content-Type: application/json" -d '{"plan_name": "free_food", "plan_display_name": "免费哟", "plan_description": "免费 is good", "available": true, "customized": false, "is_org": false}' 'http://localhost:8000/v1/plans'
```

> The above command returns JSON structured like this:

```json
{
  "plan_name": "free_food",
  "plan_display_name": "免费哟",
  "plan_description": "免费 is good",
  "available": true,
  "customized": false,
  "created_at": "2015-10-26T15:36:14.921393459+08:00",
  "updated_at": "2015-10-26T15:36:14.921393459+08:00",
  "is_org": false
}
```

This endpoint create a plan.

### HTTP Request

`POST /v1/plans`


# Quotas

## get plan quotas

> Get Plan Quotas

```shell
curl http://example.com/v1/plans/dev8x/quotas
```

> Make sure to replace `example.com` with API endpoint.

> The above command returns JSON structured like this:

```json
{
  "plan_quotas":[
    {
      "quota_name":"app_instance_type_1x","quota_display_name":"app_instance_type_1x","quota_description":"1x","quota_unit":"x","is_boolean":true,"created_at":"0001-01-01T00:00:00Z","updated_at":"2015-10-20T03:12:16Z","value":1
    },
    {"quota_name":"app_instance_type_2x","quota_display_name":"app_instance_type_2x","quota_description":"2x","quota_unit":"x","is_boolean":true,"created_at":"0001-01-01T00:00:00Z","updated_at":"2015-10-20T03:12:16Z","value":1
    },
    {"quota_name":"app_instance_type_4x","quota_display_name":"app_instance_type_4x","quota_description":"4x","quota_unit":"x","is_boolean":true,"created_at":"0001-01-01T00:00:00Z","updated_at":"2015-10-20T03:12:16Z","value":1
    },
    {"quota_name":"app_instance_type_8x","quota_display_name":"app_instance_type_8x","quota_description":"8x","quota_unit":"x","is_boolean":true,"created_at":"0001-01-01T00:00:00Z","updated_at":"2015-10-20T03:12:16Z","value":1
    },
    {"quota_name":"buildflow_count","quota_display_name":"buildflow_count","quota_description":"项目个数","quota_unit":"个","is_boolean":false,"created_at":"2015-03-23T10:51:16Z","updated_at":"2015-10-20T03:12:16Z","value":100
    }
  ]
}
```

This endpoint retrieves plan quotas.

### HTTP Request

`GET http://example.com/v1/plans/<Name>/quotas`

## add quota to plan

> add quota to plan

```shell
curl -X POST -H "Content-Type: application/json" -d '{"quota_name": "support_personal_gitlab_quota", "value": 1}' 'http://localhost:8000/v1/plans/dev8x/quotas'
```

> Make sure to replace `example.com` with API endpoint.

> The above command returns JSON structured like this:

```json
{
  "status": "ok"
}
```

This endpoint add quota to plan.

### HTTP Request

`POST http://example.com/v1/plans/<Name>/quotas`

## remove quota from plan

> remove quota from plan

```shell
curl -X DELETE -H "Content-Type: application/json" -d '{"quota_name": "support_personal_gitlab_quota"}' 'http://localhost:8000/v1/plans/dev8x/quotas'
```

> Make sure to replace `example.com` with API endpoint.

> The above command returns JSON structured like this:

```json
{
  "status": "ok"
}
```

This endpoint remove quota from plan.

### HTTP Request

`DELETE http://example.com/v1/plans/<Name>/quotas`

## Create a Quota

```shell
curl -X POST -H "Content-Type: application/json" -d '{"quota_name": "support_personal_gitlab_quota", "quota_display_name": "支持个人gitlab", "quota_description": "支持个人gitlab", "quota_unit": "", "is_boolean": true}' 'http://localhost:7777/v1/quotas'
```

> The above command returns JSON structured like this:

```json
{
  "quota_name": "support_personal_gitlab_quota",
  "quota_display_name": "支持个人gitlab",
  "quota_description": "支持个人gitlab",
  "quota_unit": "",
  "is_boolean": true,
  "created_at": "2015-10-26T15:55:13.588845284+08:00",
  "updated_at": "2015-10-26T15:55:13.588845284+08:00"
}
```

This endpoint create a quota.

### HTTP Request

`POST /v1/quotas`


# tenants

## Create a tenant

```shell
curl -X POST -H "Content-Type: application/json" -d '{"name": "test", "is_org": false}' 'http://localhost:8000/v1/tenants'
```

> The above command returns JSON structured like this:

```json
{
  "id": "59113eda-e299-4412-77fb-36fc80b5e244",
  "tenant_name": "test",
  "active": true,
  "created_at": "2015-10-26T16:07:36.155665399+08:00",
  "updated_at": "2015-10-26T16:07:36.155665399+08:00",
  "is_org": false
}
```

This endpoint create a tenant.

### HTTP Request

`POST /v1/tenants`

## get a tenant

```shell
curl 'http://localhost:8000/v1/tenants/59113eda-e299-4412-77fb-36fc80b5e244'
```

> The above command returns JSON structured like this:

```json
{
  "id": "59113eda-e299-4412-77fb-36fc80b5e244",
  "tenant_name": "test",
  "active": true,
  "created_at": "2015-10-26T08:07:36Z",
  "updated_at": "2015-10-26T08:07:36Z",
  "is_org": false
}
```

This endpoint get a tenant.

### HTTP Request

`GET /v1/tenants/<ID>`

## delete a tenant

```shell
curl -X DELETE 'http://localhost:8000/v1/tenants/59113eda-e299-4412-77fb-36fc80b5e244'
```

> The above command returns JSON structured like this:

```json
{
  "id": "59113eda-e299-4412-77fb-36fc80b5e244",
  "tenant_name": "test",
  "active": true,
  "created_at": "2015-10-26T08:07:36Z",
  "updated_at": "2015-10-26T08:07:36Z",
  "is_org": false
}
```

This endpoint delete a tenant.

### HTTP Request

`DELETE /v1/tenants/<ID>`

## get a tenant by name

```shell
curl 'http://localhost:8000/v1/tenant-name/test'
```

> The above command returns JSON structured like this:

```json
{
  "id": "59113eda-e299-4412-77fb-36fc80b5e244",
  "tenant_name": "test",
  "active": true,
  "created_at": "2015-10-26T08:07:36Z",
  "updated_at": "2015-10-26T08:07:36Z",
  "is_org": false
}
```

This endpoint get a tenant by name.

### HTTP Request

`GET /v1/tenant-name/<Name>`

## check tenant name available

```shell
curl -X POST -H "Content-Type: application/json" -d '{"name": "test"}' 'http://localhost:8000/v1/tenant-name/check-available'
```

> The above command returns JSON structured like this:

```json
{
  "available": false
}
```

This endpoint get a tenant by name.

### HTTP Request

`POST /v1/tenant-name/check-available`

## get tenant plans

> Get tenant Plans

```shell
curl http://example.com/v1/tenants/59113eda-e299-4412-77fb-36fc80b5e244/plans
```

> Make sure to replace `example.com` with API endpoint.

> The above command returns JSON structured like this:

```json
{
  "plans":[
    {
      "plan_name":"pro512x","plan_display_name":"512x 集群","plan_description":"企业套餐，最多 512 个容器，独享集群","available":true,"customized":false,"created_at":"2015-07-29T10:16:49Z","updated_at":"2015-07-29T10:16:49Z","is_org":false
    }
  ]
}
```

This endpoint retrieves tenant all plans.

### HTTP Request

`GET http://example.com/v1/tenants/<ID>/plans`

## get tenant main plan

> Get tenant main Plan

```shell
curl http://example.com/v1/tenants/59113eda-e299-4412-77fb-36fc80b5e244/plans/main
```

> Make sure to replace `example.com` with API endpoint.

> The above command returns JSON structured like this:

```json
{
  "plan_name":"pro512x","plan_display_name":"512x 集群","plan_description":"企业套餐，最多 512 个容器，独享集群","available":true,"customized":false,"created_at":"2015-07-29T10:16:49Z","updated_at":"2015-07-29T10:16:49Z","is_org":false
}
```

This endpoint retrieves tenant main plan.

### HTTP Request

`GET http://example.com/v1/tenants/<ID>/plans/main`

## change tenant main plan

> change tenant main Plan

```shell
curl -X PUT -H "Content-Type: application/json" -d '{"plan_name":"dev8x", "source": "daoweb", "remark": "some description"}' 'http://localhost:8000/v1/tenants/59113eda-e299-4412-77fb-36fc80b5e244/plans/main'
```

> Make sure to replace `example.com` with API endpoint.

> The above command returns JSON structured like this:

```json
{
  "status":"ok"
}
```

This endpoint change tenant main plan.

### HTTP Request

`PUT http://example.com/v1/tenants/<ID>/plans/main`

### URL Parameters

Parameter | Description
-------| -----------
plan_name | main plan name
source | the source of the requester (optional)
remark | some texts the requester want to record (optional)

## add customized plan to tenant

> add customized plan to tenant

```shell
curl -X POST -H "Content-Type: application/json" -H -d '{"plan_name": "award", "expired_at_seconds": 1445854253, "source": "daoweb", "remark": "some description"}' 'http://localhost:8000/v1/tenants/02e28145-2cce-4a6e-afe6-51c70290efa1/plans'
```

> Make sure to replace `example.com` with API endpoint.

> The above command returns JSON structured like this:

```json
{
  "status":"ok"
}
```

This endpoint add customized plan to tenant.

### HTTP Request

`POST http://example.com/v1/tenants/<ID>/plans`

### URL Parameters

Parameter | Description
-------| -----------
plan_name | plan name
expired_at_seconds | expiration date
source | the source of the requester (optional)
remark | some texts the requester want to record (optional)

## remove customized plan from tenant

> remove customized plan from tenant

```shell
curl -X DELETE -H "Content-Type: application/json" -H -d '{"plan_name": "award"}' 'http://localhost:8000/v1/tenants/02e28145-2cce-4a6e-afe6-51c70290efa1/plans'
```

> Make sure to replace `example.com` with API endpoint.

> The above command returns JSON structured like this:

```json
{
  "status":"ok"
}
```

This endpoint remove customized plan from tenant.

### HTTP Request

`DELETE http://example.com/v1/tenants/<ID>/plans`

## use tenant quota

> use tenant quota

```shell
curl -X POST -H "Content-Type: application/json" -d '{"quota_name": "single_runtime", "usage": 1, "source": "daoweb", "remark": "some description"}' 'http://localhost:8000/v1/tenants/eb9ee595-94ec-4b76-9418-f5de51bb55a6/quotas/use'
```

> Make sure to replace `example.com` with API endpoint.

> The above command returns JSON structured like this:

```json
{
  "tenant_id": "eb9ee595-94ec-4b76-9418-f5de51bb55a6",
  "quota_name": "single_runtime",
  "usage": 1,
  "created_at": "2015-10-20T03:17:31Z",
  "updated_at": "2015-10-20T03:17:31Z",
  "total": 1
}
```

This endpoint check and use tenant quota.

### HTTP Request

`POST http://example.com/v1/tenants/<ID>/quotas/use`

### URL Parameters

Parameter | Description
-------| -----------
quota_name | quota name
usage | usage
source | the source of the requester (optional)
remark | some texts the requester want to record (optional)

## release tenant quota

> release tenant quota

```shell
curl -X POST -H "Content-Type: application/json" -d '{"quota_name": "quota_x", "usage": 1, "source": "daoweb", "remark": "some description"}' 'http://localhost:8000/v1/tenants/eb9ee595-94ec-4b76-9418-f5de51bb55a6/quotas/release'
```

> Make sure to replace `example.com` with API endpoint.

> The above command returns JSON structured like this:

```json
{
  "tenant_id": "eb9ee595-94ec-4b76-9418-f5de51bb55a6",
  "quota_name": "quota_x",
  "usage": 1,
  "created_at": "2015-10-20T03:17:31Z",
  "updated_at": "2015-10-20T03:17:31Z",
  "total": 3
}
```

This endpoint check and release tenant quota.

### HTTP Request

`POST http://example.com/v1/tenants/<ID>/quotas/release`

### URL Parameters

Parameter | Description
-------| -----------
quota_name | quota name
usage | usage
source | the source of the requester (optional)
remark | some texts the requester want to record (optional)

## get tenant quota usage

> get tenant quota usage

```shell
curl 'http://localhost:8000/v1/tenants/eb9ee595-94ec-4b76-9418-f5de51bb55a6/quotas/quota_x'
```

> Make sure to replace `example.com` with API endpoint.

> The above command returns JSON structured like this:

```json
{
  "tenant_id": "eb9ee595-94ec-4b76-9418-f5de51bb55a6",
  "quota_name": "quota_x",
  "usage": 4,
  "created_at": "2015-10-20T03:17:16Z",
  "updated_at": "2015-10-26T03:02:14Z",
  "total": 512
}
```

This endpoint get tenant quota usage.

### HTTP Request

`GET http://example.com/v1/tenants/<ID>/quotas/<Name>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | Tenant ID
Name | Quota name
