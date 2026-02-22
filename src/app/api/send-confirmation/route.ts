import { NextResponse } from 'next/server';
import { resend } from '@/lib/resend';

export async function POST(req: Request) {
    try {
        const { orderNumber, fullName, totalAmount, items, phone } = await req.json();

        if (!process.env.RESEND_API_KEY) {
            console.warn('RESEND_API_KEY is not set. Skipping email.');
            return NextResponse.json({ success: true, message: 'Email skipped (no key)' });
        }

        // 1. Send confirmation to Customer (Mock email for now if no email provided)
        // In a real flow, you'd collect email in the checkout form.

        // 2. Send notification to Admin
        if (resend) {
            await resend.emails.send({
                from: 'Seasons By Nature <onboarding@resend.dev>',
                to: process.env.ADMIN_EMAIL || 'hello@seasonsbynature.com',
                subject: `New Order: ${orderNumber}`,
                html: `
                    <h1>New Order Received</h1>
                    <p><strong>Order Number:</strong> ${orderNumber}</p>
                    <p><strong>Customer:</strong> ${fullName}</p>
                    <p><strong>Phone:</strong> ${phone}</p>
                    <p><strong>Total:</strong> ${totalAmount} EGP</p>
                    <h3>Items:</h3>
                    <ul>
                        ${items.map((item: { name: string; quantity: number; price: number }) => `<li>${item.name} x ${item.quantity} - ${item.price} EGP</li>`).join('')}
                    </ul>
                `
            });
        }

        return NextResponse.json({ success: true });
    } catch (error) {
        console.error('Error sending email:', error);
        return NextResponse.json({ error: 'Failed to send email' }, { status: 500 });
    }
}
