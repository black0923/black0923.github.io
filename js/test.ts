class Promise {
    constructor(executor) {
        this.status = 'pending';
        this.res = undefined;
        this.err = undefined;
        this.success_callback = [];// 成功执行的回调
        this.error_callback = [];// 失败执行的回调
        const resolve = res => {
            if (this.status === 'pending') {
                this.status = 'fulfilled';
                this.res = res;
                this.success_callback.forEach(cb => cb instanceof Function && cb(res))
            }
        }
        const reject = err => {
            if (this.status === 'pending') {
                this.status = 'rejected';
                this.err = err;
                this.error_callback.forEach(cb => cb instanceof Function && cb(err))
            }
        }


        try {
            executor(resolve, reject)
        } catch (error) {
            reject(error)
        }
    }
    then(f1, f2) {
        // f1处理成功，f2处理失败
        if (this.status === 'fulfilled') {
            f1(this.res)
        }
        if (this.status === 'rejected') {
            f2(this.err)
        }
        // 订阅
        if (this.status === 'pending') {
            this.success_callback.push(f1)
            this.error_callback.push(f2)
        }
    }
}
let p = new Promise((resolve, reject) => {
    setTimeout(() => {
        resolve('success')
        // reject('error')
    }, 3000);
})
p.then(
    res => console.log('成功了：', res),
    err => console.log('失败了：', err)
)