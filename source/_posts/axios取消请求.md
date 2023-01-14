---
title: axios取消请求
date: 2023-01-14 11:42:06
tags: ajax
description: ' '
---

>如何取消axios请求
```ts
/**
 * 
 * @param data { endDate，startDate }
 * @returns 
 * @description: 获取首页数据
 */
let getHomePageInfo_cancel:Canceler | null = null
export function getHomePageInfo(data) {
    if (getHomePageInfo_cancel !== null) {
        getHomePageInfo_cancel() // 如果上次请求没结束，调用取消方法
    }
    return http.request<any>({
        url: `/sys/homePage/homePageInfo`,
        method: 'POST',
        cancelToken: new axios.CancelToken(function (c) { getHomePageInfo_cancel = c }), // 赋值取消的方法
        data
    }).then(res => {
        getHomePageInfo_cancel = null;
        return res
    })
}
```
