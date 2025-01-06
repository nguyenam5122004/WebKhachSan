using System;
using System.Threading.Tasks;

namespace WebKhachSan.Services
{
    public interface IEmailService
    {
        Task SendEmailAsync(string email, string subject, string message);
    }

    public class EmailService : IEmailService
    {
        public Task SendEmailAsync(string email, string subject, string message)
        {
            // Trong môi trường thực tế, bạn sẽ sử dụng một dịch vụ email thực sự ở đây
            Console.WriteLine($"Sending email to {email}");
            Console.WriteLine($"Subject: {subject}");
            Console.WriteLine($"Message: {message}");
            return Task.CompletedTask;
        }
    }
}

