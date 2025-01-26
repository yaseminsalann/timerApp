# timerApp
 Swift programlama dilinde bir Timer nesnesi, belirli bir zaman aralığında bir işlevin çalıştırılmasını veya tekrarlanmasını sağlamak için kullanılır. Timer'ı kullanarak bir işlemi belirli bir süre sonra başlatabilir veya döngüsel olarak çalıştırabilirsiniz.

withTimeInterval: Timer'ın zaman aralığını belirtir (saniye cinsinden).
repeats: Timer'ın tekrarlanıp tekrarlanmayacağını belirtir. false olursa sadece bir kez çalışır.
Closure: Timer tetiklendiğinde çalıştırılacak kod.
timer.invalidate(): Timer'ı durdurur.

Önemli Noktalar:
Memory Leak Önleme: Timer bir döngüde veya bir sınıf içinde kullanılıyorsa, daima timer.invalidate() çağrılarak durdurulmalıdır. Aksi halde bellek sızıntısına neden olabilir.
Main Thread: Timer varsayılan olarak ana thread üzerinde çalışır. Arka planda çalışması gerekiyorsa, bir DispatchQueue veya RunLoop ayarı yapabilirsiniz.
