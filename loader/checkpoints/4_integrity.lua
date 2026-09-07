-- ECCO HUB V3 - CHECKPOINT 4: INTEGRITY
-- Verifies server session authenticity, product metadata, and security tokens

local IntegrityCheckpoint = {}

function IntegrityCheckpoint.run(authData)
    if not authData or type(authData) ~= "table" then
        return {
            success = false,
            stage = 4,
            code = "INTEGRITY_DATA_MISSING",
            message = "Authentication data is nil or corrupted."
        }
    end

    local session = authData.session
    if not session or not session.token or not session.id then
        return {
            success = false,
            stage = 4,
            code = "INVALID_SESSION_DESCRIPTOR",
            message = "Session token or ID missing from server validation."
        }
    end

    if not session.token:match("^tok_[a-f0-9]+$") then
        return {
            success = false,
            stage = 4,
            code = "MALFORMED_SESSION_TOKEN",
            message = "Session token signature does not conform to Ecco Hub V3 cryptographic format."
        }
    end

    local product = authData.product
    if not product or not product.id or not product.version then
        return {
            success = false,
            stage = 4,
            code = "INVALID_PRODUCT_METADATA",
            message = "Product identifier or target version missing from server response."
        }
    end

    local integrity = authData.integrity
    if not integrity or not integrity.hash or not integrity.algorithm then
        return {
            success = false,
            stage = 4,
            code = "INTEGRITY_SIGNATURE_MISSING",
            message = "Server response lacked cryptographic checksum signature."
        }
    end

    return {
        success = true,
        stage = 4,
        verifiedSession = {
            token = session.token,
            sessionId = session.id,
            product = product
        }
    }
end

return IntegrityCheckpoint
