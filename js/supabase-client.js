// Shared Supabase client. Include the Supabase CDN script before this file:
// <script src="https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2.39.6"></script>
// <script src="js/supabase-client.js"></script>
const SUPABASE_URL = 'https://iunirrrnjxzxtqfgvjjn.supabase.co';
const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Iml1bmlycnJuanh6eHRxZmd2ampuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzY4NjE4ODUsImV4cCI6MjA5MjQzNzg4NX0.rVFa8YOBPcXN7bhHx1WbvYZv0aIZCtb2Y2RdXrjhtUA';

window.supabaseClient = window.supabase.createClient(SUPABASE_URL, SUPABASE_ANON_KEY);

// Escapes text before it's interpolated into innerHTML templates.
function escapeHtml(value) {
    const div = document.createElement('div');
    div.textContent = value ?? '';
    return div.innerHTML;
}

// Redirects to login-role.html if there's no active session; otherwise
// resolves with { session, profile }. Call at the top of every protected page.
async function requireSession() {
    const { data: { session } } = await window.supabaseClient.auth.getSession();
    if (!session) {
        window.location.href = 'login-role.html';
        return null;
    }
    const { data: profile, error } = await window.supabaseClient
        .from('profiles')
        .select('*')
        .eq('id', session.user.id)
        .single();
    if (error || !profile) {
        window.location.href = 'login-role.html';
        return null;
    }
    return { session, profile };
}
